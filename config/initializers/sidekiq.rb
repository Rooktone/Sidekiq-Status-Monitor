require 'redis'
require 'sidekiq'
require 'sidekiq/web'

ENV['REDIS_URL'] ||= "redis://localhost:6379"
ENV['SIDEKIQ_NAMESPACE'] ||= 'sidekiq'

redis_settings = {}
uri = URI.parse(ENV['REDIS_URL'])
redis_settings['host'] = uri.host
redis_settings['port'] = uri.port
redis_settings['db'] = uri.path
redis_settings['user'] = uri.user
redis_settings['password'] = uri.password

redis = Redis.new(
    :host => redis_settings['host'],
    :port => redis_settings['port'],
    :db => redis_settings['db'],
    :user => redis_settings['user'],
    :password => redis_settings['password'],
)

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(:size => 1, :timeout => 1, namespace: ENV['SIDEKIQ_NAMESPACE']) do
    redis
  end
end
