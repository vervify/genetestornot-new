# config/puma.rb

max_threads_count = Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
min_threads_count = Integer(ENV.fetch("RAILS_MIN_THREADS", max_threads_count))
threads min_threads_count, max_threads_count

# In Docker, listen on 0.0.0.0 and use PORT from env (compose sets PORT=80)
port        Integer(ENV.fetch("PORT", 3000))
environment ENV.fetch("RAILS_ENV", "production")

# For local “production-as-local” keep single-process unless you need workers
workers Integer(ENV.fetch("WEB_CONCURRENCY", 0))
preload_app!

# Allow `rails restart` to work
plugin :tmp_restart

bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"
