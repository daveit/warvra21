class CreateVillages < ActiveRecord::Migration
  def change
    create_table :villages do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :phone
      t.string :email
      t.date :financial_to
      t.integer :residents
      t.references :status, index: true, foreign_key: true
      t.references :suburb, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
