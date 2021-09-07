class AddWebsiteAndPhone2ToVillages < ActiveRecord::Migration
  def change
    add_column :villages, :website, :string
    add_column :villages, :phone2, :string
  end
end
