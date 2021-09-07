class PayType < ActiveRecord::Base

  has_many :ireceipts
  has_many :vreceipts
  has_many :associate_payments

  validates_presence_of :name
  validates_uniqueness_of :name

end
