
# Controller at application level. Used by all other controllers.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :first_time_visit, unless: -> { cookies[:first_visit] }

  def first_time_visit
    cookies.permanent[:first_visit] = 1
    @first_visit = CONFIGS[:enable_first_time_user_exp] ? true : false
  end
end
