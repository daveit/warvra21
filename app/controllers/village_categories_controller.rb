class VillageCategoriesController < ApplicationController
  before_action :set_village_category, only: [:show, :edit, :update, :destroy]

  # GET /village_categories
  # GET /village_categories.json
  def index
    @village_categories = VillageCategory.all
  end

  # GET /village_categories/1
  # GET /village_categories/1.json
  def show
  end

  # GET /village_categories/new
  def new
    @village_category = VillageCategory.new
  end

  # GET /village_categories/1/edit
  def edit
  end

  # POST /village_categories
  # POST /village_categories.json
  def create
    @village_category = VillageCategory.new(village_category_params)

    respond_to do |format|
      if @village_category.save
        format.html { redirect_to @village_category, notice: 'Village category was successfully created.' }
        format.json { render :show, status: :created, location: @village_category }
      else
        format.html { render :new }
        format.json { render json: @village_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /village_categories/1
  # PATCH/PUT /village_categories/1.json
  def update
    respond_to do |format|
      if @village_category.update(village_category_params)
        format.html { redirect_to @village_category, notice: 'Village category was successfully updated.' }
        format.json { render :show, status: :ok, location: @village_category }
      else
        format.html { render :edit }
        format.json { render json: @village_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /village_categories/1
  # DELETE /village_categories/1.json
  def destroy
    @village_category.destroy
    respond_to do |format|
      format.html { redirect_to village_categories_url, notice: 'Village category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_village_category
      @village_category = VillageCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def village_category_params
      params.require(:village_category).permit(:name)
    end
end
