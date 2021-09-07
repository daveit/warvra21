class CreateContactsCategories < ActiveRecord::Migration
  def change
    create_table :contacts_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
