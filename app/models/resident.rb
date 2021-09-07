class Resident < ActiveRecord::Base
  belongs_to :village

  validates :surname, presence: true
  validates :first, presence: true

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Resident.create! row.to_hash
	  end
	end  
end
