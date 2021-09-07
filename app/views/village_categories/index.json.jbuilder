json.array!(@village_categories) do |village_category|
  json.extract! village_category, :id, :name
  json.url village_category_url(village_category, format: :json)
end
