class CreateIvillages < ActiveRecord::Migration
  def change
    create_table :ivillages do |t|
      t.string :name
      t.string :address1
      t.string :suburb
      t.string :postcode
      t.string :phone1
      t.string :website
      t.string :phone2
      t.string :address2

      t.timestamps null: false
    end
  end
end
