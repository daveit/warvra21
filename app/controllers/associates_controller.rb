class AssociatesController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  def index
    @associates = Associate.all.order("surname ASC")
  end
  
  def show
  end

  def new
    @associate = Associate.new
  end

  def create
    @associate = Associate.new(associate_params)

    @associate.save
    # redirect_to @associate
      render :edit 
  end

  def update
    respond_to do |format|
      if @associate.update(associate_params)
        format.html { render :edit }
        #format.html { redirect_to @associate, notice: 'Associate was successfully updated.' }
        #format.json { render :show, status: :ok, location: @associate }
      else
        format.html { render :edit }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @associate.destroy
    respond_to do |format|
      format.html { redirect_to associates_url, notice: 'Associate has been removed!!' }
      format.json { head :no_content }
    end
  end

  def import
    Associate.import(params[:file])
    redirect_to associates_path, notice: "Import complete!"
  end

  private
  def set_individual
    @associate = Associate.find(params[:id])
  end
  def associate_params
    params.require(:associate).permit(:surname, :first, :title, :email, :payer_name, :payer_email, :payer_title, :management, :financialto, :phonemobile, :phonework, :phonehome, :payphonemobile, :payphonework, :payphonehome, :notes )
  end

end
