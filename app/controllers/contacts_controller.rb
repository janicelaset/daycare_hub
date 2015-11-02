class ContactsController < ApplicationController
  def index
    @contact = current_user.daycare.contact

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @daycare = current_user.daycare
    @contact = Contact.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @daycare = Daycare.find(params[:daycare_id])
    @contact.daycare = @daycare

    if @contact.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:notice] = "Contact information not saved"
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    @daycare = current_user.daycare

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @contact = Contact.find(params[:id])
    @daycare = current_user.daycare

    if @contact.update(contact_params)
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:notice] = "Contact information not updated"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :phone)
  end
end
