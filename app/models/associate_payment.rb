class AssociatePayment < ActiveRecord::Base
  belongs_to :associate
  belongs_to :pay_type  

  validates :datepaid, presence: true
  validates :reference, presence: true
  validates :financialto, presence: true
  
  after_save :set_financialto
  after_destroy :set_financialto_blank

  private

  def set_financialto
    self.associate.financialto = self.financialto
    self.associate.save
  end

  def set_financialto_blank
    self.associate.financialto = nil
    self.associate.save
  end

=begin
  validates :rdate, :financial_to, presence: true
  validates :amount, numericality: { greater_than: 0.01 }
  validates :pay_type_id, :presence => true




=end
end
