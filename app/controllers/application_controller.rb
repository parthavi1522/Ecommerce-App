class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :mobile_number, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :email, :mobile_number, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end
end
