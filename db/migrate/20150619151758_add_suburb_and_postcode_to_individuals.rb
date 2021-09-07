class AddSuburbAndPostcodeToIndividuals < ActiveRecord::Migration
  def change
    add_column :individuals, :suburb, :string
    add_column :individuals, :postcode, :string
  end
end
