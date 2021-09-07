class AddPhone2ToAssociates < ActiveRecord::Migration
  def change
    add_column :associates, :payphonemobile, :string
    add_column :associates, :payphonework, :string
    add_column :associates, :payphonehome, :string
  end
end
