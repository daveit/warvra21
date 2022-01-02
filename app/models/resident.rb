class Resident < ActiveRecord::Base
  belongs_to :village

  validates :surname, presence: true
  validates :first, presence: true
  validates :village_id, :presence => true
  
  scope :notcancelled, -> {
    where(dateceased: nil)
  }
  scope :notcancelledemail, -> {
    where('email is not null')
  }

  scope :iscancelled, -> {
    where('dateceased is not null')
  }

  scope :villagecount, -> { where('village_id = ?', village_id) }
  
  #scope :billed, where('invoice_id is not null')
  #scope :arecancelled, -> { where(dateceased: nil) }
  #scope :arecancelled, -> { where("dateceased > 0") }
  #scope :notbilled, where(:invoice_id => nil)
  #scope :billed, where(:invoice_id != nil)

  #scope :visible, -> {
  #where(:visible => true)
  #}

  def self.search(search)
    if search
      where('lower(surname) LIKE ? OR lower(first) LIKE ? OR lower(email) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      #where('lower(last) LIKE ? OR lower(first) LIKE ?', "%#{search}%", "%#{search}%")
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
