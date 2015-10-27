class Event < ActiveRecord::Base
  using ActiveSupport
  include PgSearch

  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, class_name: "Community", inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :start, :finish, :description, presence: true

  scope :day, lambda{ |str|
    date = Time.zone.parse(str)
    where("(start, finish) OVERLAPS (?,?)", date.beginning_of_day, date.end_of_day)
  }

  pg_search_scope :q, using: {
    tsearch: { dictionary: "russian" },
    trigram: { only: [:title], threshold: 0.285 }
  }, against: {
    title: "A",
    description: "B"
  }

  scope :forthcoming, ->(*){ order("start, finish DESC").limit(5) }
  scope :communities, ->(ids){ where(community_id: ids) }
end
