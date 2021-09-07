class AddDetailsToAssociatePayments < ActiveRecord::Migration
  def change
    add_column :associate_payments, :details, :string
    add_reference :associate_payments, :pay_type, foreign_key: true
  end
end
