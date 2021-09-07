class CreateAccBankAccounts < ActiveRecord::Migration
  def change
    create_table :acc_bank_accounts do |t|
      t.string :name
      t.decimal :opening
      t.decimal :outgoing
      t.decimal :incoming
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
