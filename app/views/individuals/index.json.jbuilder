json.array!(@individuals) do |individual|
  json.extract! individual, :id, :first, :last, :address1, :address2, :phone, :mobile, :email, :financial_to, :suburb_id, :status_id
  json.url individual_url(individual, format: :json)
end
