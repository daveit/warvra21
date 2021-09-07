class AddIvillagesToIndividuals < ActiveRecord::Migration
  def change
    add_reference :individuals, :ivillage, index: true, foreign_key: true
  end
end
