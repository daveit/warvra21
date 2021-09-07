class Title < ActiveRecord::Base
  has_many :contacts
  has_many :individuals
  validates_associated :contacts
  validates_associated :individuals
  validates_presence_of :name
  validates_uniqueness_of :name
end
