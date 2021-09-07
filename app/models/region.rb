class Region < ActiveRecord::Base
  has_many :villages
  has_many :individuals
  validates_associated :villages
  validates_associated :individuals
  validates_presence_of :name
  validates_uniqueness_of :name
end
