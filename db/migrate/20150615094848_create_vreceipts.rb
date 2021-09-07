class CreateVreceipts < ActiveRecord::Migration
  def change
    create_table :vreceipts do |t|
      t.date :rdate
      t.string :reference
      t.date :finto
      t.string :details
      t.references :village, index: true, foreign_key: true
      t.references :pay_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
