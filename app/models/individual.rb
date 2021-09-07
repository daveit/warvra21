class Individual < ActiveRecord::Base

  belongs_to :ivillage
  belongs_to :status
  belongs_to :title
  belongs_to :region
  has_and_belongs_to_many :icats
  has_many :ireceipts

  validates :first, presence: true
  validates :last, presence: true

  validates :status_id, :presence => true
  validates :ivillage_id, :presence => true
  validates :title_id, :presence => true
  validates :region_id, :presence => true

  scope :financial, -> { where(status_id: 1) }
  scope :notfinancial, -> { where(status_id: 2) }
  scope :cancelled, -> { where(status_id: 4) }

  def self.search(search)
    if search
      where('lower(last) LIKE ? OR lower(first) LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end