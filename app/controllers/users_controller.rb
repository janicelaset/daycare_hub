class UsersController < ApplicationController

  def reg_instructions
    user = User.find(params[:user_id])
    @email = user.email
  end

  def password_reset
    user = User.find(params[:user_id])
    @email = user.email
  end
end
