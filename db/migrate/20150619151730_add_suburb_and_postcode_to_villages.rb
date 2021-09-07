class AddSuburbAndPostcodeToVillages < ActiveRecord::Migration
  def change
    add_column :villages, :suburb, :string
    add_column :villages, :postcode, :string
  end
end
