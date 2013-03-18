class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  protect_from_forgery
	rescue_from CanCan::AccessDenied do |exception|

  	redirect_to :login, notice: exception.message
	end


  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end
end
