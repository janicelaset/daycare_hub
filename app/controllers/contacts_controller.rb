class ContactsController < ApplicationController
  before_action :find_daycare
  before_action :find_user, only: [:new, :create, :update]
  before_action :init_state

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.daycare = @daycare

    @contact.save
    respond_to do |format|
      if @contact.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_general_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.update(contact_params)
    respond_to do |format|
      if @contact.errors.any?
        format.html { render :wizard }
      else
        format.html { redirect_to wizard_general_user_daycare_path(@user, @daycare) }
      end
      format.js
    end
  end

  def wizard
    @wizard = true
    
    @daycare = Daycare.find_by_url(params[:id])

    if @daycare.contact.nil?  #if user has not added contact information
      @contact = Contact.new
    else
      @contact = @daycare.contact
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def contact_params
    params.require(:contact).permit(:email, :phone)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end

  def find_user
    @user = @daycare.user
  end

  def init_state
    @wizard = false
  end
end
