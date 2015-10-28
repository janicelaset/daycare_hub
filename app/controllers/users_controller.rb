class UsersController < ApplicationController
  def show
    @daycare = current_user.daycare
  end

  def new
    @daycare = Daycare.new
  end

  def edit
    @daycare = current_user.daycare

    if (@daycare.contact.nil?)
      @contact = Contact.new
    else
      @contact = @daycare.contact
    end
  end
end
