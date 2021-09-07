class AccAccountsController < ApplicationController
  before_action :set_acc_account, only: [:show, :edit, :update, :destroy]

  # GET /acc_accounts
  # GET /acc_accounts.json
  def index
    @acc_accounts = AccAccount.all
  end

  # GET /acc_accounts/1
  # GET /acc_accounts/1.json
  def show
  end

  # GET /acc_accounts/new
  def new
    @acc_account = AccAccount.new
  end

  # GET /acc_accounts/1/edit
  def edit
  end

  # POST /acc_accounts
  # POST /acc_accounts.json
  def create
    @acc_account = AccAccount.new(acc_account_params)

    respond_to do |format|
      if @acc_account.save
        format.html { redirect_to @acc_account, notice: 'Acc account was successfully created.' }
        format.json { render :show, status: :created, location: @acc_account }
      else
        format.html { render :new }
        format.json { render json: @acc_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_accounts/1
  # PATCH/PUT /acc_accounts/1.json
  def update
    respond_to do |format|
      if @acc_account.update(acc_account_params)
        format.html { redirect_to @acc_account, notice: 'Acc account was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_account }
      else
        format.html { render :edit }
        format.json { render json: @acc_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_accounts/1
  # DELETE /acc_accounts/1.json
  def destroy
    @acc_account.destroy
    respond_to do |format|
      format.html { redirect_to acc_accounts_url, notice: 'Acc account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_account
      @acc_account = AccAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_account_params
      params.require(:acc_account).permit(:name, :numtran, :balance, :code, :acc_type_id)
    end
end
