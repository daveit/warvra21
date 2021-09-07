class CreateSuburbs < ActiveRecord::Migration
  def change
    create_table :suburbs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
