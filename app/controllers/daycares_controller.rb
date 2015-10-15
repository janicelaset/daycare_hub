class DaycaresController < ApplicationController
  def index
    @daycares = Daycare.all
  end
end
