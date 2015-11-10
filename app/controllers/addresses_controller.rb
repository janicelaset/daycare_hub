class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @daycare = Daycare.find(params[:daycare_id])
    @address.daycare = @daycare


    @address.save

    respond_to do |format|
      format.html
      format.js
    end

  end

  def update
    @address = Address.find(params[:id])
    @daycare = current_user.daycare

    @address.update(address_params)

    respond_to do |format|
      format.html
      format.js
    end

  end

  private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

end
