class Community < ActiveRecord::Base
  extend ArrayAttributes

  has_many :events, inverse_of: :community

  mount_uploader :logo, ::CommunityLogoUploader

  array_attribute :tags

  validates :hashtag, :logo, :description, presence: true

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
