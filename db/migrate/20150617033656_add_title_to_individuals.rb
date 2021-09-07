class AddTitleToIndividuals < ActiveRecord::Migration
  def change
    add_reference :individuals, :title, index: true, foreign_key: true
  end
end
