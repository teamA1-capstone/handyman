class ApplicationController < ActionController::Base

  $SWITCH = 1

  before_action :configure_permitted_parameters, if:  :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street_address, :city, :state, :zip_code, :specialty])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street_address, :city, :state, :zip_code, :specialty])
  end

end
