class ContactsController < ApplicationController
  before_action :find_daycare

  def create
    @contact = Contact.new(contact_params)
    @contact.daycare = @daycare

    @contact.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @contact = Contact.find(params[:id])

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

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
