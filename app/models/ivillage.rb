class Ivillage < ActiveRecord::Base

  has_many :individuals
  # validates_associated :individuals
  validates :name, presence: true
  validates_uniqueness_of :name

end
