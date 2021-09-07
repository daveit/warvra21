class CreateAccTrans < ActiveRecord::Migration
  def change
    create_table :acc_trans do |t|
      t.integer :log_id
      t.date :tdate
      t.decimal :amount, precision: 8, scale: 2
      t.string :ref1
      t.string :ref2
      t.string :details
      t.references :acc_bank_account, index: true, foreign_key: true
      t.references :acc_account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
