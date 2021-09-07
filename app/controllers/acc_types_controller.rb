class AccTypesController < ApplicationController
  before_action :set_acc_type, only: [:show, :edit, :update, :destroy]

  # GET /acc_types
  # GET /acc_types.json
  def index
    @acc_types = AccType.all
  end

  # GET /acc_types/1
  # GET /acc_types/1.json
  def show
  end

  # GET /acc_types/new
  def new
    @acc_type = AccType.new
  end

  # GET /acc_types/1/edit
  def edit
  end

  # POST /acc_types
  # POST /acc_types.json
  def create
    @acc_type = AccType.new(acc_type_params)

    respond_to do |format|
      if @acc_type.save
        format.html { redirect_to @acc_type, notice: 'Acc type was successfully created.' }
        format.json { render :show, status: :created, location: @acc_type }
      else
        format.html { render :new }
        format.json { render json: @acc_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_types/1
  # PATCH/PUT /acc_types/1.json
  def update
    respond_to do |format|
      if @acc_type.update(acc_type_params)
        format.html { redirect_to @acc_type, notice: 'Acc type was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_type }
      else
        format.html { render :edit }
        format.json { render json: @acc_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_types/1
  # DELETE /acc_types/1.json
  def destroy
    @acc_type.destroy
    respond_to do |format|
      format.html { redirect_to acc_types_url, notice: 'Acc type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_type
      @acc_type = AccType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_type_params
      params.require(:acc_type).permit(:name)
    end
end
