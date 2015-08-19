class CoverUploader < ApplicationUploader
  process resize_to_fill: [851, 315] # facebook cover size

  version :retina do
    process resize_to_fill: [1702, 630]

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
