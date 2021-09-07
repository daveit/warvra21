class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :mobile
      t.string :email
      t.references :position, index: true, foreign_key: true
      t.references :village, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
