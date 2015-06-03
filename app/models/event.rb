class Event < ActiveRecord::Base
  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :date, :start, :finish, :description, presence: true

  scope :on, ->(day = nil) { day ? where(date: day) : where(date: Date.today.beginning_of_month..Date.today.end_of_month) }
end
