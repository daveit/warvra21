class Resident < ActiveRecord::Base
  belongs_to :village

  validates :surname, presence: true
  validates :first, presence: true
  
  scope :notcancelled, -> {
    where(dateceased: nil)
  }

  scope :iscancelled, -> {
    where('dateceased is not null')
  }

  #scope :billed, where('invoice_id is not null')
 # scope :arecancelled, -> { where(dateceased: nil) }
  #scope :arecancelled, -> { where("dateceased > 0") }
  #scope :notbilled, where(:invoice_id => nil)
  #scope :billed, where(:invoice_id != nil)

  #scope :visible, -> {
  #where(:visible => true)
  #}

  def self.search(search)
    if search
      where('lower(surname) LIKE ?', "%#{search}%")
    else
      all
    end
  end

  #def self.import(file)
	#  CSV.foreach(file.path, headers: true) do |row|
	#    Resident.create! row.to_hash
	#  end
	#end
    
end
