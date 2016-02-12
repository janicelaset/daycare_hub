class RegistrationsController < Devise::RegistrationsController

  before_action :one_admin_registered?

  protected

  def one_admin_registered?
    if ((Admin.count == 1) & (admin_signed_in?))
      redirect_to rails_admin_path
    elsif Admin.count == 1
      redirect_to new_admin_session_path
    end
  end

end
