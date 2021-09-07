class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  # GET /individuals
  # GET /individuals.json
  def index
    @individuals = Individual.search(params[:search]).order("last ASC")
  end

  def financial
    @individuals = Individual.financial
    render action: :index
  end

  def notfinancial
    @individuals = Individual.notfinancial
    render action: :index
  end

  def cancelled
    @individuals = Individual.cancelled
    render action: :index
  end

  # GET /individuals/1
  # GET /individuals/1.json
  def show
  end

  # GET /individuals/new
  def new
    @individual = Individual.new
  end

  # GET /individuals/1/edit
  def edit
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @individual = Individual.new(individual_params)

    respond_to do |format|
      if @individual.save
        format.html { redirect_to @individual, notice: 'Individual was successfully created.' }
        format.json { render :show, status: :created, location: @individual }
      else
        format.html { render :new }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1
  # PATCH/PUT /individuals/1.json
  def update
    respond_to do |format|
      if @individual.update(individual_params)
        format.html { redirect_to @individual, notice: 'Individual was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  # DELETE /individuals/1.json
  def destroy
    @individual.destroy
    respond_to do |format|
      format.html { redirect_to individuals_url, notice: 'Individual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual
      @individual = Individual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_params
      params.require(:individual).permit(:first, :last, :address1, :address2, :phone,
        :mobile, :email, :financial_to, :suburb, :postcode, :status_id, :ivillage_id, :title_id, :region_id, {:icat_ids => []})
    end
end
