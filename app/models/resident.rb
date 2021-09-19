class Resident < ActiveRecord::Base
  belongs_to :village

  validates :surname, presence: true
  validates :first, presence: true
  
  def self.search(search)
    if search
      where('lower(surname) LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Resident.create! row.to_hash
	  end
	end  
end
