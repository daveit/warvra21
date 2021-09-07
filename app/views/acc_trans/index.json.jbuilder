json.array!(@acc_trans) do |acc_tran|
  json.extract! acc_tran, :id, :log_id, :tdate, :amount, :ref1, :ref2, :details, :acc_bank_account_id, :acc_account_id
  json.url acc_tran_url(acc_tran, format: :json)
end
