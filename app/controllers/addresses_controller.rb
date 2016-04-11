class AddressesController < ApplicationController
  before_action :find_daycare, except: [:wizard]
  before_action :find_user, only: [:create, :update]

  def new
    @address = Address.new
    @user = @daycare.user

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @address = Address.new(address_params)
    @address.daycare = @daycare

    @address.save
    respond_to do |format|
      if @address.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_contact_user_daycare_path(@user, @daycare) }
      end
      format.js
    end

  end

  def update
    @address = Address.find(params[:id])

    @address.update(address_params)

    respond_to do |format|
      if @address.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_contact_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def wizard
    @daycare = Daycare.find_by_url(params[:id])

    if @daycare.address.nil?  #if user has not added address information
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

  def find_user
    @user = @daycare.user
  end
end
