json.array!(@ivillages) do |ivillage|
  json.extract! ivillage, :id, :name, :address1, :suburb, :postcode, :phone1, :website, :phone2, :address2
  json.url ivillage_url(ivillage, format: :json)
end
