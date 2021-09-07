class AddPhoneToAssociates < ActiveRecord::Migration
  def change
    add_column :associates, :phonemobile, :string
    add_column :associates, :phonework, :string
    add_column :associates, :phonehome, :string
  end
end
