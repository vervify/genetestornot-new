# syntax=docker/dockerfile:1
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t wat .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name wat wat

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.5
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Rails app lives here
WORKDIR /rails

# Install base packages
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      curl \
      postgresql-client \
      ca-certificates gnupg && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js (LTS) from NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libyaml-dev pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install application gems
# 1) Match Bundler version to Gemfile.lock ("BUNDLED WITH")
#    If you don't know it yet, open Gemfile.lock and check the last lines.
ARG BUNDLER_VERSION=2.4.19
RUN gem install bundler -v $BUNDLER_VERSION

COPY Gemfile Gemfile.lock ./

# 2) Install gems with clearer logs and retries
RUN bundle config set without 'development test' \
 && bundle config set deployment 'true' \
 && bundle install --jobs=4 --retry=3 --verbose

# 3) Clean bundler caches (split from install so failures are obvious)
RUN rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# 4) Only precompile bootsnap if it's actually in the bundle
RUN if bundle show bootsnap > /dev/null 2>&1; then \
      echo 'Precompiling bootsnap cache…' && bundle exec bootsnap precompile --gemfile; \
    else \
      echo 'bootsnap not in bundle; skipping precompile.'; \
    fi

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile




# Final stage for app image
FROM base

# Copy built artifacts: gems, application
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Run and own only the runtime files as a non-root user for security
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log tmp
USER 1000:1000

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start server via Thruster by default, this can be overwritten at runtime
EXPOSE 80
CMD ["./bin/rails", "server"]
