class Contact < ActiveRecord::Base

  belongs_to :position
  belongs_to :village
  belongs_to :title

  validates :position, :presence => true
  validates :title, :presence => true
  validates :name, presence: true

  validates :title_id, :presence => true
  validates :position_id, :presence => true

  def self.search(search)
    if search
      where('lower(name) LIKE ?', "%#{search}%")
    else
      all
    end
  end

end
