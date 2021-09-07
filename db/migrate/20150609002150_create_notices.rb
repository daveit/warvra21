class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :notes
      t.boolean :finalised

      t.timestamps null: false
    end
  end
end
