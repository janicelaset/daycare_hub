class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :user_name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:user_name, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    if current_admin
      rails_admin_path
    else
      if current_user.daycare.nil?
        new_user_daycare_path(current_user)
      else
        @daycare = Daycare.find(current_user.daycare.id)
        if @daycare.address.nil?
          new_daycare_address_path(@daycare)
        else
          edit_user_daycare_path(current_user, @daycare)
        end
      end
    end
 end
end
