class ToppagesController < ApplicationController
  def index
    if logged_in?
      @lessons = current_user.lessons.order(id: :desc).page(params[:page])
    end
  end
end
