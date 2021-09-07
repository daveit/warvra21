class IcatsController < ApplicationController
  before_action :set_icat, only: [:show, :edit, :update, :destroy]

  # GET /icats
  # GET /icats.json
  def index
    @icats = Icat.all
  end

  # GET /icats/1
  # GET /icats/1.json
  def show
  end

  # GET /icats/new
  def new
    @icat = Icat.new
  end

  # GET /icats/1/edit
  def edit
  end

  # POST /icats
  # POST /icats.json
  def create
    @icat = Icat.new(icat_params)

    respond_to do |format|
      if @icat.save
        format.html { redirect_to @icat, notice: 'Icat was successfully created.' }
        format.json { render :show, status: :created, location: @icat }
      else
        format.html { render :new }
        format.json { render json: @icat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icats/1
  # PATCH/PUT /icats/1.json
  def update
    respond_to do |format|
      if @icat.update(icat_params)
        format.html { redirect_to @icat, notice: 'Icat was successfully updated.' }
        format.json { render :show, status: :ok, location: @icat }
      else
        format.html { render :edit }
        format.json { render json: @icat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icats/1
  # DELETE /icats/1.json
  def destroy
    @icat.destroy
    respond_to do |format|
      format.html { redirect_to icats_url, notice: 'Icat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icat
      @icat = Icat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icat_params
      params.require(:icat).permit(:name)
    end
end
