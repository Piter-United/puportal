class Event < ActiveRecord::Base
  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :date, :start, :finish, :description, presence: true

  scope :ordered, ->{ order("events.start DESC")  }
end
