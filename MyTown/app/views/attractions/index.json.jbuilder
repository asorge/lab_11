json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :street, :town_id, :latitude, :longitude
  json.url attraction_url(attraction, format: :json)
end
