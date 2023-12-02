require 'sidekiq'
require_relative './app'
redis_url = 'redis://localhost:6379/0'

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, size: 10, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = {url: redis_url, size: 10, network_timeout: 5 }
end