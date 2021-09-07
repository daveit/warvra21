class AccLogsController < ApplicationController
  before_action :set_acc_log, only: [:show, :edit, :update, :destroy]

  # GET /acc_logs
  # GET /acc_logs.json
  def index
    @acc_logs = AccLog.all
  end

  # GET /acc_logs/1
  # GET /acc_logs/1.json
  def show
  end

  # GET /acc_logs/new
  def new
    @acc_log = AccLog.new
  end

  # GET /acc_logs/1/edit
  def edit
  end

  # POST /acc_logs
  # POST /acc_logs.json
  def create
    @acc_log = AccLog.new(acc_log_params)

    respond_to do |format|
      if @acc_log.save
        format.html { redirect_to @acc_log, notice: 'Acc log was successfully created.' }
        format.json { render :show, status: :created, location: @acc_log }
      else
        format.html { render :new }
        format.json { render json: @acc_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_logs/1
  # PATCH/PUT /acc_logs/1.json
  def update
    respond_to do |format|
      if @acc_log.update(acc_log_params)
        format.html { redirect_to @acc_log, notice: 'Acc log was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_log }
      else
        format.html { render :edit }
        format.json { render json: @acc_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_logs/1
  # DELETE /acc_logs/1.json
  def destroy
    @acc_log.destroy
    respond_to do |format|
      format.html { redirect_to acc_logs_url, notice: 'Acc log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_log
      @acc_log = AccLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_log_params
      params.require(:acc_log).permit(:id, :account_id, :bank_acc_id, :debits, :credits, :balance, :user_id)
    end
end
