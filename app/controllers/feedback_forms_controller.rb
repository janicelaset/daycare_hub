class FeedbackFormsController < ApplicationController
before_action :find_daycare

def new
  @feedback_form = FeedbackForm.new
  
  respond_to do |format|
    format.html
    format.js
  end
end

def create
  @feedback_form = FeedbackForm.new(feedback_form_params)
  @feedback_form.request = request
  @feedback_form.deliver

  respond_to do |format|
    format.html
    format.js
  end
end

private
def feedback_form_params
  params.require(:feedback_form).permit(:name, :email, :message, :nickname)
end

def find_daycare
  @daycare = Daycare.find_by_url(params[:daycare_id])
end
end
