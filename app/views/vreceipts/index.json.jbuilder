json.array!(@vreceipts) do |vreceipt|
  json.extract! vreceipt, :id, :rdate, :reference, :finto, :details, :village_id, :pay_type_id
  json.url vreceipt_url(vreceipt, format: :json)
end
