class CommunityLogoUploader < ApplicationUploader
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :retina_thumb do
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
