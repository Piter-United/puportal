json.array!(@events) do |event|
  json.extract! event, :id, :date, :title, :description, :community_id, :location
  json.url event_url(event, format: :json)
end
