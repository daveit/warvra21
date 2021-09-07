json.array!(@villages) do |village|
  json.extract! village, :id, :name, :address, :status_id, :suburb_id
  json.url village_url(village, format: :json)
end
