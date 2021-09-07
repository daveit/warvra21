class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :villages, :residents, :numres
  end
end
