class CreateAssociatePayments < ActiveRecord::Migration
  def change
    create_table :associate_payments do |t|
      t.date :datepaid
      t.decimal :amount
      t.string :reference
      t.date :financialto
      t.references :associate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
