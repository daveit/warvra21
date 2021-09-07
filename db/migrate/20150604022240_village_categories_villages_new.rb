class VillageCategoriesVillagesNew < ActiveRecord::Migration
  def change
  	create_table :village_categories_villages, id: false do |t|
      t.belongs_to :village_category, index: true
      t.belongs_to :village, index: true
    end
  end
end
