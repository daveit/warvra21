json.array!(@acc_logs) do |acc_log|
  json.extract! acc_log, :id, :id, :account_id, :bank_acc_id, :debits, :credits, :balance, :user_id
  json.url acc_log_url(acc_log, format: :json)
end
