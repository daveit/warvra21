class CreateAccAccounts < ActiveRecord::Migration
  def change
    create_table :acc_accounts do |t|
      t.string :name
      t.string :type
      t.integer :numtran
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
