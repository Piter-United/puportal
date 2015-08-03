class CommunityLogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end

  version :card do
    process resize_to_fill: [200, 200]
  end

  version :retina_card do
    process resize_to_fill: [400, 400]

    # http://blog.remarkablelabs.com/2013/01/creating-retina-images-with-carrierwave

    def full_filename(for_file = model.logo.file)
      super.tap do |file_name|
        file_name.gsub(".", "@2x.").gsub("retina_", "")
      end
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
