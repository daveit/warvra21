class Suburb < ActiveRecord::Base
	#has_many :villages

	paginates_per 25

	#scope :search, lambda { |search| where("name LIKE ?", "%#{search}%")}

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			all
		end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Suburb.create! row.to_hash
	  end
	end

end
