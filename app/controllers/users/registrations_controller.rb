module Users
  class Users::RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
      customer_dashboard_path
    end
  end
end