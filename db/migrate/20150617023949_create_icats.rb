class CreateIcats < ActiveRecord::Migration
  def change
    create_table :icats do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
