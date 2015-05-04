class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :tags
end
