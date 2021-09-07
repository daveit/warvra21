class CreateAccSettings < ActiveRecord::Migration
  def change
    create_table :acc_settings do |t|
      t.string :bank
      t.integer :log_num
      t.string :organisation_name
      t.date :fin_year_ending

      t.timestamps null: false
    end
  end
end
