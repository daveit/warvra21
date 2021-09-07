class AccTran < ActiveRecord::Base
  belongs_to :acc_bank_account
  belongs_to :acc_account
end
