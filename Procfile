web: bundle exec unicorn -p 4018
redis: redis-server
workers: bundle exec sidekiq
log: touch log/development.log && tail -F log/development.log