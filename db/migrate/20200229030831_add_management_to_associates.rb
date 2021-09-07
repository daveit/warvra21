class AddManagementToAssociates < ActiveRecord::Migration
  def change
    add_column :associates, :management, :boolean
  end
end
