json.array!(@acc_bank_accounts) do |acc_bank_account|
  json.extract! acc_bank_account, :id, :name, :opening, :outgoing, :incoming, :balance
  json.url acc_bank_account_url(acc_bank_account, format: :json)
end
