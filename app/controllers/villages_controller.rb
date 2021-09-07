class VillagesController < ApplicationController
  before_action :set_village, only: [:show, :edit, :update, :destroy]

  # GET /villages
  # GET /villages.json

  def index
    @villages = Village.search(params[:search]).order("name ASC")
  end

=begin
  def index
    @villages = Village.search(params[:search])
    if @villages.class == Array
      @villages = Kaminari.paginate_array(@villages).page(params[:page]).per(15).order("name ASC")
    else
      @villages = @villages.page(params[:page]).per(15).order("name ASC") # if @posts is AR::Relation object
    end
  end
=end

  def financial
    @villages = Village.financial
    render action: :index
  end

  def notfinancial
    @villages = Village.notfinancial
    render action: :index
  end

  def prospect
    @villages = Village.prospect
    render action: :index
  end

  def cancelled
    @villages = Village.cancelled
    render action: :index
  end

  # GET /villages/1
  # GET /villages/1.json
  def show
    @notices = Notice.order(created_at: :desc).where(finalised: false)
  end

  # GET /villages/new
  def new
    @village = Village.new
  end

  # GET /villages/1/edit
  def edit
  end

  # POST /villages
  # POST /villages.json
  def create
    @village = Village.new(village_params)

    respond_to do |format|
      if @village.save
        format.html { redirect_to @village, notice: 'Village was successfully created.' }
        format.json { render :show, status: :created, location: @village }
      else
        format.html { render :new }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /villages/1
  # PATCH/PUT /villages/1.json
  def update
    respond_to do |format|
      if @village.update(village_params)
        format.html { redirect_to @village, notice: 'Village was successfully updated.' }
        format.json { render :show, status: :ok, location: @village }
      else
        format.html { render :edit }
        format.json { render json: @village.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /villages/1
  # DELETE /villages/1.json
  def destroy
    @village.destroy
    respond_to do |format|
      format.html { redirect_to villages_url, notice: 'Village was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village
      @village = Village.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_params
      params.require(:village).permit(:name, :address, :address2, :phone, :email, :financial_to,
        :numres, :status_id, :owner, :operator, :memorial_number, :manager, :suburb, :postcode, :region_id, {:village_category_ids => []})
    end
end
