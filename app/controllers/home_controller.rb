class HomeController < ApplicationController
  def index
  end

  def geocoding
    respond_to do |format|
      format.js
    end
  end

  def reverse_geocoding
    respond_to do |format|
      format.js
    end
  end

  def show
    @address = params[:search]
    @radius = params["radius-value"]

    @nearby = Address.where("state = 'OR'")

    respond_to do |format|
      format.js
    end
  end

end
