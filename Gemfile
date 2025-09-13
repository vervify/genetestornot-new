source 'https://rubygems.org'

# Specify Ruby version (Rails 8 requires Ruby 3.2+)
ruby '3.4.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [default in Rails 8]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [default in Rails 8]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [default in Rails 8]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [default in Rails 8]
gem 'stimulus-rails'

gem 'susy'

# Build JSON APIs with ease
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [default in Rails 8]
# gem 'kredis'

# Use Active Model has_secure_password [default in Rails 8]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [default in Rails 8]
# gem 'image_processing', '~> 1.2'

# Replace Sass with Dartsass for SCSS support
gem 'dartsass-sprockets'

# jQuery support (keeping for existing JavaScript)
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'sprockets-rails'

# Font Awesome icons
gem 'font-awesome-rails', '~> 4.7'

# Normalize CSS
gem 'normalize-rails'

# featherlight for video modals (check compatibility or replace)
gem 'featherlight'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw], require: 'debug/prelude'

  # Static analysis for security vulnerabilities [default in Rails 8]
  gem 'brakeman', require: false

  # Omakase Ruby styling [default in Rails 8]
  gem 'rubocop-rails-omakase', require: false

  # Enhanced Rails console
  gem 'pry-rails'
end

group :development do
  # Use console on exceptions pages [default in Rails 8]
  gem 'web-console'

  # Add speed badges [default in Rails 8]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [default in Rails 8]
  # gem 'spring'
end

group :production do
  # For Heroku deployment (replaces rails_12factor)
  gem 'rails_serve_static_assets'
  gem 'rails_stdout_logging'
end
