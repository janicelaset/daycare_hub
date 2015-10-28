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
end
