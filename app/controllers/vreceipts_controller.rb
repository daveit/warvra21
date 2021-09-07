class VreceiptsController < ApplicationController
  before_action :set_vreceipt, only: [:show, :edit, :update, :destroy]

  # GET /vreceipts
  # GET /vreceipts.json
  def index
    @vreceipts = Vreceipt.all.order("rdate DESC")
  end

  # GET /vreceipts/1
  # GET /vreceipts/1.json
  def show
  end

  # GET /vreceipts/new
  def new
    @vreceipt = Vreceipt.new
  end

  # GET /vreceipts/1/edit
  def edit
  end

  # POST /vreceipts
  # POST /vreceipts.json
  def create
    @village = Village.find(params[:village_id])
    @vreceipt = @village.vreceipts.create(vreceipt_params)
    redirect_to village_path(@village)
  end

=begin
  def create
    @vreceipt = Vreceipt.new(vreceipt_params)

    respond_to do |format|
      if @vreceipt.save
        format.html { redirect_to @vreceipt, notice: 'Vreceipt was successfully created.' }
        format.json { render :show, status: :created, location: @vreceipt }
      else
        format.html { render :new }
        format.json { render json: @vreceipt.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # PATCH/PUT /vreceipts/1
  # PATCH/PUT /vreceipts/1.json
  def update
    respond_to do |format|
      if @vreceipt.update(vreceipt_params)
        format.html { redirect_to vreceipts_url, notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @vreceipt }
      else
        format.html { render :edit }
        format.json { render json: @vreceipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vreceipts/1
  # DELETE /vreceipts/1.json
  def destroy
    @vreceipt.destroy
    respond_to do |format|
      format.html { redirect_to vreceipts_url, notice: 'Receipt was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vreceipt
      @vreceipt = Vreceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vreceipt_params
      params.require(:vreceipt).permit(:rdate, :reference, :finto, :details, :village_id, :pay_type_id, :recamount)
    end
end
