class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :username, :address, :mobile_number, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :username, :address, :mobile_number, :profile])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end
end
