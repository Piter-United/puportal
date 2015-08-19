class Event < ActiveRecord::Base
  using ActiveSupport

  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, class_name: "Community", inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :start, :finish, :description, presence: true

  scope :day, lambda{ |str|
    date = Time.zone.parse(str)
    where("start >= ?", date.beginning_of_day).where("finish <= ?", date.end_of_day)
  }

  scope :forthcoming, lambda{ |*|
    order("start, finish DESC").limit(5)
  }

  scope :communities, ->(ids){ where(community_id: ids) }
end
