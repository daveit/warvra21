class CreateIreceipts < ActiveRecord::Migration
  def change
    create_table :ireceipts do |t|
      t.date :rdate
      t.decimal :amount, precision: 6, scale: 2
      t.string :reference
      t.string :details
      t.date :financial_to
      t.references :individual, index: true, foreign_key: true
      t.references :pay_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
