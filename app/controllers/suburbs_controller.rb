class SuburbsController < ApplicationController
  before_action :set_suburb, only: [:show, :edit, :update, :destroy]

  # GET /suburbs
  # GET /suburbs.json
  def index
    #@suburbs = Suburb.order(:name).page params[:page]
    #@suburbs = Suburb.search.page params[:page]
    #@villages = Village.search(params[:search]).order("name ASC")
    #@suburbs = Suburb.search(params[:search]).order("name ASC")
      @suburbs = Suburb.search(params[:search])
      if @suburbs.class == Array
        @suburbs = Kaminari.paginate_array(@suburbs).page(params[:page]).per(20).order("name ASC")
      else
        @suburbs = @suburbs.page(params[:page]).per(20).order("name ASC") # if @posts is AR::Relation object
      end
  end

  # GET /suburbs/1
  # GET /suburbs/1.json
  def show
  end

  # GET /suburbs/new
  def new
    @suburb = Suburb.new
  end

  # GET /suburbs/1/edit
  def edit
  end

  # POST /suburbs
  # POST /suburbs.json
  def create
    @suburb = Suburb.new(suburb_params)

    respond_to do |format|
      if @suburb.save
        format.html { redirect_to @suburb, notice: 'Suburb was successfully created.' }
        format.json { render :show, status: :created, location: @suburb }
      else
        format.html { render :new }
        format.json { render json: @suburb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suburbs/1
  # PATCH/PUT /suburbs/1.json
  def update
    respond_to do |format|
      if @suburb.update(suburb_params)
        format.html { redirect_to @suburb, notice: 'Suburb was successfully updated.' }
        format.json { render :show, status: :ok, location: @suburb }
      else
        format.html { render :edit }
        format.json { render json: @suburb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suburbs/1
  # DELETE /suburbs/1.json
  def destroy
    @suburb.destroy
    respond_to do |format|
      format.html { redirect_to suburbs_url, notice: 'Suburb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
   Suburb.import(params[:file])
   redirect_to suburbs_path, notice: "Imported!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suburb
      @suburb = Suburb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suburb_params
      params.require(:suburb).permit(:name)
    end
end
