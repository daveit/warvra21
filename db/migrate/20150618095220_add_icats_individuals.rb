class AddIcatsIndividuals < ActiveRecord::Migration
  def change
    create_table :icats_individuals, id: false do |t|
      t.belongs_to :icat, index: true
      t.belongs_to :individual, index: true
    end
  end
end

