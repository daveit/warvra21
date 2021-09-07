class AccTransController < ApplicationController
  before_action :set_acc_tran, only: [:show, :edit, :update, :destroy]

  # GET /acc_trans
  # GET /acc_trans.json
  def index
    @acc_trans = AccTran.all
  end

  # GET /acc_trans/1
  # GET /acc_trans/1.json
  def show
  end

  # GET /acc_trans/new
  def new
    @acc_tran = AccTran.new
  end

  # GET /acc_trans/1/edit
  def edit
  end

  # POST /acc_trans
  # POST /acc_trans.json
  def create
    @acc_tran = AccTran.new(acc_tran_params)

    respond_to do |format|
      if @acc_tran.save
        format.html { redirect_to @acc_tran, notice: 'Acc tran was successfully created.' }
        format.json { render :show, status: :created, location: @acc_tran }
      else
        format.html { render :new }
        format.json { render json: @acc_tran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_trans/1
  # PATCH/PUT /acc_trans/1.json
  def update
    respond_to do |format|
      if @acc_tran.update(acc_tran_params)
        format.html { redirect_to @acc_tran, notice: 'Acc tran was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_tran }
      else
        format.html { render :edit }
        format.json { render json: @acc_tran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_trans/1
  # DELETE /acc_trans/1.json
  def destroy
    @acc_tran.destroy
    respond_to do |format|
      format.html { redirect_to acc_trans_url, notice: 'Acc tran was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_tran
      @acc_tran = AccTran.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_tran_params
      params.require(:acc_tran).permit(:log_id, :tdate, :amount, :ref1, :ref2, :details, :acc_bank_account_id, :acc_account_id)
    end
end
