class UserPasswordsController < Devise::PasswordsController

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    user_password_reset_instructions_path(resource)
  end
end
