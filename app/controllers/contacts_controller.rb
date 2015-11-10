class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @daycare = Daycare.find(params[:daycare_id])
    @contact.daycare = @daycare

    @contact.save

    respond_to do |format|
      format.html
      format.js
    end

  end

  def update
    @contact = Contact.find(params[:id])
    @daycare = current_user.daycare

    @contact.update(contact_params)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :phone)
  end
end
