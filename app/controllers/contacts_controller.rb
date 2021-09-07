class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.search(params[:search]).order("name ASC")
  end
  
  def show
  end

  def create
    @village = Village.find(params[:village_id])
    @contact = @village.contacts.create(contact_params)
    redirect_to village_path(@village)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_url, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully deleted.' }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :mobile, :email, :title_id, :admin, :position_id, :village_id)
  end

end
