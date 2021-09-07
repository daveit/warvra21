class Resident < ActiveRecord::Base
  belongs_to :village

  def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Resident.create! row.to_hash
	  end
	end  
end
