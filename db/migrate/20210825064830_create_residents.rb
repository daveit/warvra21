class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.date :datereceived
      t.date :dateaccepted
      t.string :surname
      t.string :first
      t.string :email
      t.string :address
      t.string :suburb
      t.string :postcode
      t.string :phone
      t.date :dateceased
      t.string :comment
      t.references :village, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
