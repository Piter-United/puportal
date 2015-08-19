class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog unless Rails.env.test? || Rails.env.development?

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end
end
