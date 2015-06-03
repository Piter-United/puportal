class Community < ActiveRecord::Base
  extend ArrayAttributes
  include PgSearch

  has_many :events, inverse_of: :community

  mount_uploader :logo, ::CommunityLogoUploader

  array_attribute :tags

  validates :hashtag, :logo, :description, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  pg_search_scope :full_text_search, using: {
                                       tsearch: { dictionary: 'russian' },
                                       trigram: { only: [:name, :hashtag], threshold: 0.285 }
                                     },
                                     against: {
                                       name: 'A',
                                       hashtag: 'B',
                                       description: 'C'
                                     }

  scope :search, ->(params) { params[:q].present? ? full_text_search(params[:q]) : all }
end
