class AccBankAccountsController < ApplicationController
  before_action :set_acc_bank_account, only: [:show, :edit, :update, :destroy]

  # GET /acc_bank_accounts
  # GET /acc_bank_accounts.json
  def index
    @acc_bank_accounts = AccBankAccount.all
  end

  # GET /acc_bank_accounts/1
  # GET /acc_bank_accounts/1.json
  def show
  end

  # GET /acc_bank_accounts/new
  def new
    @acc_bank_account = AccBankAccount.new
  end

  # GET /acc_bank_accounts/1/edit
  def edit
  end

  # POST /acc_bank_accounts
  # POST /acc_bank_accounts.json
  def create
    @acc_bank_account = AccBankAccount.new(acc_bank_account_params)

    respond_to do |format|
      if @acc_bank_account.save
        format.html { redirect_to @acc_bank_account, notice: 'Acc bank account was successfully created.' }
        format.json { render :show, status: :created, location: @acc_bank_account }
      else
        format.html { render :new }
        format.json { render json: @acc_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_bank_accounts/1
  # PATCH/PUT /acc_bank_accounts/1.json
  def update
    respond_to do |format|
      if @acc_bank_account.update(acc_bank_account_params)
        format.html { redirect_to @acc_bank_account, notice: 'Acc bank account was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_bank_account }
      else
        format.html { render :edit }
        format.json { render json: @acc_bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_bank_accounts/1
  # DELETE /acc_bank_accounts/1.json
  def destroy
    @acc_bank_account.destroy
    respond_to do |format|
      format.html { redirect_to acc_bank_accounts_url, notice: 'Acc bank account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_bank_account
      @acc_bank_account = AccBankAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_bank_account_params
      params.require(:acc_bank_account).permit(:name, :opening, :outgoing, :incoming, :balance)
    end
end
