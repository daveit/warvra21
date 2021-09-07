class AddCodeAndNumberToAccBankAccounts < ActiveRecord::Migration
  def change
    add_column :acc_bank_accounts, :code, :string
    add_column :acc_bank_accounts, :num_trans, :integer
  end
end
