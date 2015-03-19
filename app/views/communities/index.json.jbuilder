json.array!(@communities) do |community|
  json.extract! community, :id, :name, :description, :leaders, :site, :vk, :facebook, :twitter, :meetupcom, :google
  json.url community_url(community, format: :json)
end
