class AssociatePaymentsController < ApplicationController

  def create
    @associate = Associate.find(params[:associate_id])
    @associatepayments = @associate.associate_payments.create(associate_payments_params)
    redirect_to associate_path(@associate)
  end

  def new
    @assocatepayments = AssociatePayments.new
  end

  private
  def associate_payments_params
    params.require(:associate_payment).permit(:datepaid, :amount, :reference, :financialto, :associate_id, :details, :pay_type_id )
  end

end
