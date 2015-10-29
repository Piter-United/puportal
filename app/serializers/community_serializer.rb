class CommunitySerializer < ActiveModel::Serializer
  include MD

  attributes :id,
             :elem,
             :name,
             :short_name,
             :hashtag,
             :description,
             :tags,
             :created_at,
             :updated_at

  has_many :users

  def description
    markdown.render(object.description.to_s).html_safe
  end
end
