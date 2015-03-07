web: bin/rails server -p $PORT -e $RAILS_ENV
redis: redis-server --loglevel warning --appendfsync no --save ""
worker: bundle exec sidekiq
