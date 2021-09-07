class Position < ActiveRecord::Base
  has_many :contacts
  validates_associated :contacts
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
