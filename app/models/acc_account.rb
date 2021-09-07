class AccAccount < ActiveRecord::Base
  belongs_to :acc_type
  has_many :acc_trans
  validates :name, presence: true
  validates_uniqueness_of :name
end
