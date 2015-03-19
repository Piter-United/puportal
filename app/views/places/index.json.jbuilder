json.array!(@places) do |place|
  json.extract! place, :id, :address, :description, :company_id, :photos
  json.url place_url(place, format: :json)
end
