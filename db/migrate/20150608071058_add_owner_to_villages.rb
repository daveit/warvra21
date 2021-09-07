class AddOwnerToVillages < ActiveRecord::Migration
  def change
    add_column :villages, :owner, :string
    add_column :villages, :operator, :string
    add_column :villages, :memorial_number, :string
  end
end
