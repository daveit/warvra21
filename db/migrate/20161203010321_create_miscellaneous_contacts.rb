class CreateMiscellaneousContacts < ActiveRecord::Migration
  def change
    create_table :miscellaneous_contacts do |t|
      t.string :name
      t.text :address
      t.string :workphone
      t.string :mobilephone
      t.string :emailaddress
      t.references :ContactsCategory, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
