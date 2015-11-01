class PartnerLogoUploader < ApplicationUploader
  process resize_to_fill: [120, 120]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
