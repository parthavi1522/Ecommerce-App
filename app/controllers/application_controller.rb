class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :store_user_location!, if: :storable_location?

  protected
  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :username, :address, :mobile_number, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :username, :address, :mobile_number, :profile])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.admin?
        admin_dashboard_path
      else
        stored_location_for(resource_or_scope) || customer_dashboard_path
      end
    else
      super
    end
  end

  private

  def storable_location?
    request.get? &&
      is_navigational_format? &&
      !devise_controller? &&
      !request.xhr? &&
      request.path != root_path
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
