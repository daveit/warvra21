class IreceiptsController < ApplicationController
  before_action :set_ireceipt, only: [:show, :edit, :update, :destroy]

  # GET /ireceipts
  # GET /ireceipts.json
  def index
    @ireceipts = Ireceipt.all.order("rdate DESC")
  end

  # GET /ireceipts/1
  # GET /ireceipts/1.json
  def show
  end

  # GET /ireceipts/new
  def new
    @ireceipt = Ireceipt.new
  end

  # GET /ireceipts/1/edit
  def edit
  end

  # POST /ireceipts
  # POST /ireceipts.json
  def create
    @individual = Individual.find(params[:individual_id])
    @ireceipt = @individual.ireceipts.create(ireceipt_params)
    #redirect_to individuals_path(@individual)
    redirect_to @individual
  end

=begin
  def create
    @ireceipt = Ireceipt.new(ireceipt_params)

    respond_to do |format|
      if @ireceipt.save
        format.html { redirect_to @ireceipt, notice: 'Ireceipt was successfully created.' }
        format.json { render :show, status: :created, location: @ireceipt }
      else
        format.html { render :new }
        format.json { render json: @ireceipt.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # PATCH/PUT /ireceipts/1
  # PATCH/PUT /ireceipts/1.json
  def update
    respond_to do |format|
      if @ireceipt.update(ireceipt_params)
        format.html { redirect_to ireceipts_url, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @ireceipt }
      else
        format.html { render :edit }
        format.json { render json: @ireceipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ireceipts/1
  # DELETE /ireceipts/1.json
  def destroy
    @ireceipt.destroy
    respond_to do |format|
      format.html { redirect_to ireceipts_url, notice: 'Receipt was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ireceipt
      @ireceipt = Ireceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ireceipt_params
      params.require(:ireceipt).permit(:rdate, :amount, :reference, :details, :financial_to, :individual_id, :pay_type_id)
    end
end
