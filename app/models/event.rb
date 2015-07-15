class Event < ActiveRecord::Base
  extend ArrayAttributes
  extend EmbeddedAttribute

  belongs_to :community, inverse_of: :events

  array_attribute :tags
  embedded :location, Location

  validates :community, :title, :date, :start, :finish, :description, presence: true

  scope :on, lambda { |day = nil|
    if day
      where(date: day)
    else
      current_month = Time.zone.today.beginning_of_month..Time.zone.today.end_of_month
      where(date: current_month)
    end
  }
end
