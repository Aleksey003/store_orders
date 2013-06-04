class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  layout :layout_by_resource
  before_filter :set_i18n_locale_from_params
  before_filter :current_cart
  
  include ApplicationHelper


 
  protect_from_forgery

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not avaible"
        logger.error flash.now[:notice]
      end
    end
  end 

 

  def default_url_options
    {locale: I18n.locale}
  end

 

	rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  	redirect_to new_user_session_path, notice: exception.message
	end

  def layout_by_resource
    if devise_controller?
      "application_login"
    else
      "application"
    end
  end

end
