class AddTitleToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :title_id, :integer
  end
end
