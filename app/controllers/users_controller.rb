class UsersController < ApplicationController
  def show

  end

  def new
    @daycare = Daycare.new
  end
end
