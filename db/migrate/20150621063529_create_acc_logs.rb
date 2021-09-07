class CreateAccLogs < ActiveRecord::Migration
  def change
    create_table :acc_logs do |t|
      t.integer :log_id
      t.integer :account_id
      t.integer :bank_acc_id
      t.decimal :debits, :decimal, precision: 8, scale: 2
      t.decimal :credits, :decimal, precision: 8, scale: 2
      t.decimal :balance, :decimal, precision: 8, scale: 2
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
