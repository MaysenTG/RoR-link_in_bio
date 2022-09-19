class ApplicationController < ActionController::Base
  
  # Don't run the edit_when_loggedin method if the home#landingpage method is called
  before_action :edit_when_loggedin
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, if: :devise_controller?

  def edit_when_loggedin
    return unless current_account
    # Get current URL and compare it to the URL of the landingpage
    # Only redirect if not on the edit landingpage path
    # if !(request.path.include?("edit") or request.path.include?("account") or request.path.include?("landingpages"))
    #   redirect_to edit_landingpage_path(Landingpage.where(account_id: current_account.id).first.id)
    # end
    #redirect_to edit_landingpage_path(Landingpage.where(url: current_account.landingpage_url).first.id)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :landingpage_url])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :landingpage_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :facebook, :twitter, :linkedin, :github])
  end
  
  
end
