class ContactsCategoriesController < ApplicationController
  before_action :set_contacts_category, only: [:show, :edit, :update, :destroy]

  # GET /contacts_categories
  # GET /contacts_categories.json
  def index
    @contacts_categories = ContactsCategory.all
  end

  # GET /contacts_categories/1
  # GET /contacts_categories/1.json
  def show
  end

  # GET /contacts_categories/new
  def new
    @contacts_category = ContactsCategory.new
  end

  # GET /contacts_categories/1/edit
  def edit
  end

  # POST /contacts_categories
  # POST /contacts_categories.json
  def create
    @contacts_category = ContactsCategory.new(contacts_category_params)

    respond_to do |format|
      if @contacts_category.save
        format.html { redirect_to @contacts_category, notice: 'Contacts category was successfully created.' }
        format.json { render :show, status: :created, location: @contacts_category }
      else
        format.html { render :new }
        format.json { render json: @contacts_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts_categories/1
  # PATCH/PUT /contacts_categories/1.json
  def update
    respond_to do |format|
      if @contacts_category.update(contacts_category_params)
        format.html { redirect_to @contacts_category, notice: 'Contacts category was successfully updated.' }
        format.json { render :show, status: :ok, location: @contacts_category }
      else
        format.html { render :edit }
        format.json { render json: @contacts_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts_categories/1
  # DELETE /contacts_categories/1.json
  def destroy
    @contacts_category.destroy
    respond_to do |format|
      format.html { redirect_to contacts_categories_url, notice: 'Contacts category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacts_category
      @contacts_category = ContactsCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacts_category_params
      params.require(:contacts_category).permit(:name)
    end
end
