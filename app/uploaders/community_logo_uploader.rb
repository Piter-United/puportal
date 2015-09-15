class CommunityLogoUploader < ApplicationUploader
  version :thumb do
    process resize_to_fill: [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
