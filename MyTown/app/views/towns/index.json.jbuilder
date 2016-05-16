json.array!(@towns) do |town|
  json.extract! town, :id, :name, :state, :description, :latitude, :longitude
  json.url town_url(town, format: :json)
end
