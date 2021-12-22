class AddNotesToAssociates < ActiveRecord::Migration
  def change
    add_column :associates, :notes, :text
  end
end