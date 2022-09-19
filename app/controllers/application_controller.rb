class ApplicationController < ActionController::Base
  
  # Don't run the edit_when_loggedin method if the home#landingpage method is called
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  before_action :edit_when_loggedin

  def edit_when_loggedin
    return unless current_account
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :landingpage_url])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :landingpage_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :facebook, :twitter, :linkedin, :github, :avatar])
  end
end
