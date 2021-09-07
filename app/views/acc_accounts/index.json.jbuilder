json.array!(@acc_accounts) do |acc_account|
  json.extract! acc_account, :id, :name, :type, :numtran, :balance
  json.url acc_account_url(acc_account, format: :json)
end
