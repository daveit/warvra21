class CreateAccTypes < ActiveRecord::Migration
  def change
    create_table :acc_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
