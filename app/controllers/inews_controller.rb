class InewsController < ApplicationController
  before_action :set_inews, only: [:show, :edit, :update, :destroy]

  # GET /inews
  # GET /inews.json
  def index
    @inews = Inews.all
  end

  # GET /inews/1
  # GET /inews/1.json
  def show
  end

  # GET /inews/new
  def new
    @inews = Inews.new
  end

  # GET /inews/1/edit
  def edit
  end

  # POST /inews
  # POST /inews.json
  def create
    @inews = Inews.new(inews_params)

    respond_to do |format|
      if @inews.save
        format.html { redirect_to @inews, notice: 'Inews was successfully created.' }
        format.json { render :show, status: :created, location: @inews }
      else
        format.html { render :new }
        format.json { render json: @inews.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inews/1
  # PATCH/PUT /inews/1.json
  def update
    respond_to do |format|
      if @inews.update(inews_params)
        format.html { redirect_to @inews, notice: 'Inews was successfully updated.' }
        format.json { render :show, status: :ok, location: @inews }
      else
        format.html { render :edit }
        format.json { render json: @inews.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inews/1
  # DELETE /inews/1.json
  def destroy
    @inews.destroy
    respond_to do |format|
      format.html { redirect_to inews_index_url, notice: 'Inews was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inews
      @inews = Inews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inews_params
      params.require(:inews).permit(:title, :first, :last, :idate, :description, :status, :total, :subject, :body, :fromemail)
    end
end
