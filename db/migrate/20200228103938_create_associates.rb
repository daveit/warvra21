class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.string :surname
      t.string :first
      t.string :title
      t.string :email
      t.string :payer_name
      t.string :payer_title
      t.string :payer_email
      t.date :financial_to

      t.timestamps null: false
    end
  end
end
