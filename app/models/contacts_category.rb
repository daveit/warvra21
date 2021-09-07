class ContactsCategory < ActiveRecord::Base

  has_many :miscellaneouscontacts

  validates_presence_of :name
  validates_uniqueness_of :name

end
