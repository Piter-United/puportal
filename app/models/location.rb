class Location < Struct.new(:address, :latitude, :longitude)
  include ActiveModel::Model
  include ActiveModel::Dirty

  define_attribute_methods *members
  alias attribute []

  validates :address, :latitude, :longitude, presence: true

  def initialize(data)
    data.each { |k,v| self.send("#{ k }=", v) if self.respond_to?("#{ k }=") }
  end

  def self.load(data = {})
    new(data) if data
  end

  def self.dump(model)
    model.to_h
  end
end