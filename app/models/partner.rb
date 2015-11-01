class Partner < ActiveRecord::Base
  mount_uploader :logo, PartnerLogoUploader

  validates :name, :url, presence: true
  validates_url_format_of :url
end
