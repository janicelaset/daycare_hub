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
    binding.pry
  end
end
