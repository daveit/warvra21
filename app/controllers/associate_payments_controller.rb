class AssociatePaymentsController < ApplicationController
  before_action :set_ass_pay, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    @associate = Associate.find(params[:associate_id])
    @associatepayments = @associate.associate_payments.create(associate_payments_params)
    redirect_to associate_path(@associate)
  end

  def new
    @assocatepayments = AssociatePayments.new
  end

  def edit
    @associatepayments = @associate.associate_payments_edit(associate_payments_params)
  end

  def update
    respond_to do |format|
      if @associatepayments.update(associate_payments_params)
        format.html { redirect_to associate_path(@associate), notice: 'Associate Payment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_ass_pay
    @associatepayments = AssociatePayment.find(params[:id])
  end
  def associate_payments_params
    params.require(:associate_payment).permit(:datepaid, :amount, :reference, :financialto, :associate_id, :details, :pay_type_id )
  end

end
