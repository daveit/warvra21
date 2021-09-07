json.array!(@icats) do |icat|
  json.extract! icat, :id, :name
  json.url icat_url(icat, format: :json)
end
