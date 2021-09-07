class Vreceipt < ActiveRecord::Base
  belongs_to :village
  belongs_to :pay_type

  validates :rdate, :finto, presence: true
  validates :recamount, numericality: { greater_than: 0.01 }
  validates :pay_type_id, :presence => true

  after_save :set_financial_to
  after_destroy :set_financial_to_blank

  private

  def set_financial_to
    #village.update_attributes(financial_to: vreceipt.finto)
    self.village.financial_to = self.finto
    self.village.status_id = 1
    self.village.save
  end

  def set_financial_to_blank
    self.village.financial_to = nil
    self.village.status_id = 2
    self.village.save
  end

end
