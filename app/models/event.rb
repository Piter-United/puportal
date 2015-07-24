class Event < ActiveRecord::Base
  using ActiveSupport

  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :date, :start, :finish, :description, presence: true

  scope :on,            ->(day = nil){ day ? where(date: day) : current_month }
  scope :current_month, ->{ where(date: Time.current_month) }
  scope :current_week,  ->{ where(date: Time.current_week) }
end
