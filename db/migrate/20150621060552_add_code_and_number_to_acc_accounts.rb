class AddCodeAndNumberToAccAccounts < ActiveRecord::Migration
  def change
    add_column :acc_accounts, :code, :string
    add_column :acc_accounts, :debits, :decimal, precision: 8, scale: 2
    add_column :acc_accounts, :credits, :decimal, precision: 8, scale: 2
  end
end
