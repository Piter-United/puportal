class CoverUploader < ApplicationUploader
  process resize_to_fill: [851, 315] # facebook cover size

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
