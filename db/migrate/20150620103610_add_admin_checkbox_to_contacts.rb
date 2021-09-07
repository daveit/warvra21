class AddAdminCheckboxToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :admin, :boolean
  end
end
