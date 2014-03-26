class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :redirect_https
  after_filter :store_location

  def redirect_https
    if Rails.env.production?   
      redirect_to :protocol => "https://" unless request.ssl?
      return true
    end
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => "Hey, bud. Subscribe to get in on that action. Sign in if you're already subscribed."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(
        :email, 
        :password, 
        :password_confirmation, 
        :first_name,
        :last_name, 
        :newsletter
      ) 
    end
  end
end
