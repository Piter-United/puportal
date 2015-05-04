class EventSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :tags,
             :start,
             :finish,
             :created_at,
             :updated_at

  has_one :community

  def address
    {
      title: object.address,
      latitude: object.latitude,
      longitude: object.longitude
    }
  end

  def logo
    {
      original: object.logo.url,
      thumb: object.logo.thumb.url
    }
  end
end
