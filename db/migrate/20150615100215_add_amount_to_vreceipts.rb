class AddAmountToVreceipts < ActiveRecord::Migration
  def change
    add_column :vreceipts, :recamount, :decimal, precision: 6, scale: 2
  end
end
