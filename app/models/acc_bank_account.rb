class AccBankAccount < ActiveRecord::Base
  has_many :acc_trans
  validates :name, presence: true
  validates_uniqueness_of :name
end
