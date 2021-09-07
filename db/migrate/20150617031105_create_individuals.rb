class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :first
      t.string :last
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :mobile
      t.string :email
      t.date :financial_to
      t.references :suburb, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
