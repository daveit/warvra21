class MiscellaneousContactsController < ApplicationController
  before_action :set_miscellaneous_contact, only: [:show, :edit, :update, :destroy]

  # GET /miscellaneous_contacts
  # GET /miscellaneous_contacts.json
  def index
    @miscellaneous_contacts = MiscellaneousContact.all
  end

  # GET /miscellaneous_contacts/1
  # GET /miscellaneous_contacts/1.json
  def show
  end

  # GET /miscellaneous_contacts/new
  def new
    @miscellaneous_contact = MiscellaneousContact.new
  end

  # GET /miscellaneous_contacts/1/edit
  def edit
  end

  # POST /miscellaneous_contacts
  # POST /miscellaneous_contacts.json
  def create
    @miscellaneous_contact = MiscellaneousContact.new(miscellaneous_contact_params)

    respond_to do |format|
      if @miscellaneous_contact.save
        format.html { redirect_to @miscellaneous_contact, notice: 'Miscellaneous contact was successfully created.' }
        format.json { render :show, status: :created, location: @miscellaneous_contact }
      else
        format.html { render :new }
        format.json { render json: @miscellaneous_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miscellaneous_contacts/1
  # PATCH/PUT /miscellaneous_contacts/1.json
  def update
    respond_to do |format|
      if @miscellaneous_contact.update(miscellaneous_contact_params)
        format.html { redirect_to @miscellaneous_contact, notice: 'Miscellaneous contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @miscellaneous_contact }
      else
        format.html { render :edit }
        format.json { render json: @miscellaneous_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miscellaneous_contacts/1
  # DELETE /miscellaneous_contacts/1.json
  def destroy
    @miscellaneous_contact.destroy
    respond_to do |format|
      format.html { redirect_to miscellaneous_contacts_url, notice: 'Miscellaneous contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miscellaneous_contact
      @miscellaneous_contact = MiscellaneousContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miscellaneous_contact_params
      params.require(:miscellaneous_contact).permit(:name, :address, :workphone, :mobilephone, :emailaddress, :ContactsCategory_id, :notes)
    end
end
