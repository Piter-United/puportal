class CommunitySerializer < ActiveModel::Serializer
  include MD

  attributes :id,
             :name,
             :description,
             :tags,
             :elem,
             :logo

  has_many :users

  def description
    markdown.render(object.description.to_s).html_safe
  end

  def elem
    name[0..2]
  end

  def logo
    object.logo.thumb.url
  end
end
