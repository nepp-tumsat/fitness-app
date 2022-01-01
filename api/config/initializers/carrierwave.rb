CarrierWave.configure do |config|
  config.asset_host = ENV['API_URL']
  config.storage = :file
  config.cache_storage = :file
end