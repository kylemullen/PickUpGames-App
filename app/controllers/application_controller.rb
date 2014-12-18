class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  end
end
