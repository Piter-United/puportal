class Community < ActiveRecord::Base
  extend ArrayAttributes

  has_many :events, inverse_of: :community

  mount_uploader :logo, ::CommunityLogoUploader

  array_attribute :tags

  validates :name, :hashtag, :logo, :description, presence: true

end
