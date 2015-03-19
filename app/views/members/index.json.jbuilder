json.array!(@members) do |member|
  json.extract! member, :id, :name, :links, :email, :login, :password, :avatar
  json.url member_url(member, format: :json)
end
