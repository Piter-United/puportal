CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    require "fog/aws"

    config.fog_provider = "fog/aws"
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["S3_KEY"],
      aws_secret_access_key: ENV["S3_SECRET"],
    }

    config.fog_directory = "piter-united-#{Rails.env}"
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
