class AddManagerToVillages < ActiveRecord::Migration
  def change
    add_column :villages, :manager, :string
  end
end
