class AccType < ActiveRecord::Base
  has_many :acc_accounts
  validates :name, presence: true
  validates_uniqueness_of :name
end
