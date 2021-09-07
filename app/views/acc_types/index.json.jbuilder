json.array!(@acc_types) do |acc_type|
  json.extract! acc_type, :id, :name
  json.url acc_type_url(acc_type, format: :json)
end
