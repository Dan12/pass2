class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #used to get the curretn user from the session's user_id, if nil, current user is false
  helper_method :current_user
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def home
    render "index"
  end
end
