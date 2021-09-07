class Ireceipt < ActiveRecord::Base

  belongs_to :individual
  belongs_to :pay_type

  validates :rdate, :financial_to, presence: true
  validates :amount, numericality: { greater_than: 0.01 }
  validates :pay_type_id, :presence => true

  after_save :set_financial_to
  after_destroy :set_financial_to_blank

  private

  def set_financial_to
    self.individual.financial_to = self.financial_to
    self.individual.status_id = 1
    self.individual.save
  end

  def set_financial_to_blank
    self.individual.financial_to = nil
    self.individual.status_id = 2
    self.individual.save
  end

end
