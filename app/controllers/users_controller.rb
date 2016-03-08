class UsersController < ApplicationController

  def instructions
    user = User.find(params[:user_id])
    @email = user.email
  end
end
