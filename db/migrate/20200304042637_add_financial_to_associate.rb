class AddFinancialToAssociate < ActiveRecord::Migration
  def change
    add_column :associates, :financialto, :date
  end
end
