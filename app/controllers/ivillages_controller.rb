class IvillagesController < ApplicationController
  before_action :set_ivillage, only: [:show, :edit, :update, :destroy]

  # GET /ivillages
  # GET /ivillages.json
  def index
    @ivillages = Ivillage.all.order("name ASC")
  end

  # GET /ivillages/1
  # GET /ivillages/1.json
  def show
  end

  # GET /ivillages/new
  def new
    @ivillage = Ivillage.new
  end

  # GET /ivillages/1/edit
  def edit
  end

  # POST /ivillages
  # POST /ivillages.json
  def create
    @ivillage = Ivillage.new(ivillage_params)

    respond_to do |format|
      if @ivillage.save
        format.html { redirect_to @ivillage, notice: 'Ivillage was successfully created.' }
        format.json { render :show, status: :created, location: @ivillage }
      else
        format.html { render :new }
        format.json { render json: @ivillage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ivillages/1
  # PATCH/PUT /ivillages/1.json
  def update
    respond_to do |format|
      if @ivillage.update(ivillage_params)
        format.html { redirect_to @ivillage, notice: 'Ivillage was successfully updated.' }
        format.json { render :show, status: :ok, location: @ivillage }
      else
        format.html { render :edit }
        format.json { render json: @ivillage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ivillages/1
  # DELETE /ivillages/1.json
  def destroy
    @ivillage.destroy
    respond_to do |format|
      format.html { redirect_to ivillages_url, notice: 'Ivillage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ivillage
      @ivillage = Ivillage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ivillage_params
      params.require(:ivillage).permit(:name, :address1, :suburb, :postcode, :phone1, :website, :phone2, :address2)
    end
end
