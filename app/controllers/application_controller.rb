class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  
  
  protected
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,:terms_of_service,:send_updates, :profile_image, :personal_mobile])
     devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :profile_image,:phone_number,:birthday,:address,:state,:postal_code,:license_country,:license_number,:license_state,:licensefront,:licenseback, :pickup_suburb, :pickup_postcode, :pickup_state, :rental,:advance_notice,:driving_liecense_country,:driving_liecense_state,:driving_liecense_number, :driving_liecense_firstname, :driving_liecense_middlename, :driving_liecense_lastname,:personal_house_number, :personal_street_name, :personal_suburb, :personal_state, :personal_postcode,:personal_dob, :personal_mobile,:step,availibility_days: []])
  end
end
