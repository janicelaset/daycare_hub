class ContactFormsController < ApplicationController
  before_action :find_daycare

  def create
    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.request = request
    @contact_form.deliver

    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname, :recipient)
  end

  def find_daycare
    @daycare = Daycare.find_by_url(params[:daycare_id])
  end
end
