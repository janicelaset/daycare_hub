class AddressesController < ApplicationController
  before_action :find_daycare, except: [:wizard]

  def create
    @address = Address.new(address_params)
    @address.daycare = @daycare

    @address.save
    respond_to do |format|
      format.html
      format.js
    end

  end

  def update
    @address = Address.find(params[:id])

    @address.update(address_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def wizard
    @daycare = Daycare.find_by_url(params[:id])

    if @daycare.address.nil?  #if user has not added contact information
      @address = Address.new
    else
      @address = @daycare.address
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
