class CreateInews < ActiveRecord::Migration
  def change
    create_table :inews do |t|
      t.string :title
      t.string :first
      t.string :last
      t.date :idate
      t.string :description
      t.string :status
      t.string :total
      t.string :subject
      t.text :body
      t.string :fromemail

      t.timestamps null: false
    end
  end
end
