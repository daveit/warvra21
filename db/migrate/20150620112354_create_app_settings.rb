class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.decimal :Vrate
      t.decimal :Irate
      t.integer :LastInvNum

      t.timestamps null: false
    end
  end
end
