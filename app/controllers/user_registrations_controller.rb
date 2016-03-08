class UserRegistrationsController < Devise::RegistrationsController

protected
  def after_inactive_sign_up_path_for(resource)
    user_registration_instructions_path(resource)
  end

end
