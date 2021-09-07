class AddRegionToIndividuals < ActiveRecord::Migration
  def change
    add_reference :individuals, :region, index: true, foreign_key: true
  end
end
