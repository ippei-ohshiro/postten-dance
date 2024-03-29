class ApplicationController < ActionController::Base
  include SessionsHelper  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_lessons = user.lessons.count
    @count_attendances = user.att_lessons.count
  end
end
