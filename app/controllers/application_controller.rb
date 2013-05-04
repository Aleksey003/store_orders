class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  layout :layout_by_resource
  before_filter :set_i18n_locale_from_params

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

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @user = current_cart
    cart = @user.create_cart
    session[:cart_id] = cart.id
    cart
  end 

	rescue_from CanCan::AccessDenied do |exception|
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
