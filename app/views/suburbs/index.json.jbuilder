json.array!(@suburbs) do |suburb|
  json.extract! suburb, :id, :name
  json.url suburb_url(suburb, format: :json)
end
