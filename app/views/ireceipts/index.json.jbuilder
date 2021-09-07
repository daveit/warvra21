json.array!(@ireceipts) do |ireceipt|
  json.extract! ireceipt, :id, :rdate, :amount, :reference, :details, :financial_to, :individual_id, :pay_type_id
  json.url ireceipt_url(ireceipt, format: :json)
end
