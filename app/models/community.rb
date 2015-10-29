class Community < ActiveRecord::Base
  extend ArrayAttributes
  include PgSearch

  has_many :events,  class_name: "Event",  inverse_of: :community
  has_many :members, class_name: "Member", inverse_of: :community
  has_many :users,   class_name: "User",   through: :members

  array_attribute :tags

  validates :hashtag, :description, :short_name, presence: true
  validates :name, :hashtag, :elem, presence: true, uniqueness: { case_sensitive: false }

  pg_search_scope :full_text_search, using: {
    tsearch: { dictionary: "russian" },
    trigram: { only: [:name, :hashtag], threshold: 0.285 }
  }, against: {
    name: "A",
    hashtag: "B",
    description: "C"
  }

  scope :filter, ->(params){ params[:q].present? ? full_text_search(params[:q]) : all }

  scope :fresh, ->(*){ order("created_at DESC").limit(5) }
end
