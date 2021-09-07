class AddRegionToVillages < ActiveRecord::Migration
  def change
    add_reference :villages, :region, index: true, foreign_key: true
  end
end
