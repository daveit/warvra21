class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  # GET /residents
  def index
    #@residents = Resident.notcancelled.search(params[:search]).order("surname ASC")
    @residents = Resident.notcancelled.order("surname ASC").search(params[:search])
    render action: :index
    #@residents = Resident.notcancelled.search(params[:search]).order("surname ASC").page(params[:page]).per(5)
    #@residents = Resident.notcancelled.search(params[:search]).order("surname ASC")
    #@residents = Resident.notcancelled.page(params[:page]).per(5).search(params[:search]).order("surname ASC")
    #@residents = Resident.search(params[:search]).order("surname ASC")
    #if @residents.class == Array
    #  @residents = Kaminari.paginate_array(@residents).page(params[:page]).per(30).order("surname ASC")
    #else
    #  @residents = @residents.page(params[:page]).per(35).order("surname ASC")
#      @products = Product.order("name").page(params[:page]).per(5)
    #end
  end

  def iscancelled
    @residents = Resident.iscancelled.order("surname ASC").search(params[:search])
    render action: :index
  end

#  def arecancelled
#    @residents = Resident.arecancelled.page(params[:page]).per(5).search(params[:search]).order("surname ASC")
#    render action: :index
#  end

  # GET /residents/1
  # GET /residents/1.json
  def show
  end

  # GET /residents/new
  def new
    @resident = Resident.new
  end

  # GET /residents/1/edit
  def edit
  end

  # POST /residents
  # POST /residents.json
  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        format.html { redirect_to @resident, notice: 'Resident was successfully created.' }
        format.json { render :show, status: :created, location: @resident }
      else
        format.html { render :new }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residents/1
  # PATCH/PUT /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to @resident, notice: 'Resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residents/1
  # DELETE /residents/1.json
  def destroy
    @resident.destroy
    respond_to do |format|
      format.html { redirect_to residents_url, notice: 'Resident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
   Resident.import(params[:file])
   redirect_to residents_path, notice: "Import complete!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resident
      @resident = Resident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_params
      params.require(:resident).permit(:datereceived, :dateaccepted, :surname, :first, :email, :address, :suburb, :postcode, :phone, :dateceased, :comment, :village_id)
    end
end
