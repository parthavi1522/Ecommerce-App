module Users
  class Users::RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)

      if resource.save
        sign_up(resource_name, resource)
        CartMerger.new(resource, session).merge!

        redirect_to after_sign_up_path_for(resource), notice: 'Welcome! You have signed up successfully.'
      else
        clean_up_passwords(resource)
        set_minimum_password_length
        respond_with resource
      end
    end

    protected

    def after_sign_up_path_for(resource)
      customer_dashboard_path
    end
  end
end