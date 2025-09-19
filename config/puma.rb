# config/puma.rb

max_threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
min_threads_count = Integer(ENV.fetch("RAILS_MIN_THREADS", max_threads_count))
threads min_threads_count, max_threads_count

environment ENV.fetch("RAILS_ENV", "production")

workers Integer(ENV.fetch("WEB_CONCURRENCY", 0))
preload_app!

plugin :tmp_restart

# Explicit bind is clearest in Docker
bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"