class ApplicationController < ActionController::Base

  $SWITCH = 1
  $SPECIALTY_TYPES = Array["Electrician", "Light Fixture", "Painter", "Plumber", "Sound System", "Carpenter", "Computer Repair Servicer", "Other"]

  before_action :configure_permitted_parameters, if:  :devise_controller?
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :street_address, :city, :state, :zip_code, :specialty, :invisibility])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :street_address, :city, :state, :zip_code, :specialty, :invisibility])
  end
  # This method is used to override the automatice redirection of the submit 
  # buttom (after signing-up) to be the worker's home page not the customer's.
  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      home_path
    else
      worker_home_path
    end
  end
  
  def after_sign_out_path_for(resource)
    if $SWITCH == 1
      home_path
    else
      worker_home_path
    end
  end

  def worker_root_path
    worker_home_path
  end

  def customer_root_path
    home_path
  end
end
