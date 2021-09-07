class CreateVillageCategories < ActiveRecord::Migration
  def change
    create_table :village_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
