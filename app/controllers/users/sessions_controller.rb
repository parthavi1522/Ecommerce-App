module Users
  class SessionsController < Devise::SessionsController
    def new
      super
    end

    def create
      unless params[:user].present?
        flash[:alert] = "Invalid login request"
        redirect_to new_user_session_path and return
      end

      user = User.find_by(username: params[:user][:username])

      if user&.valid_password?(params[:user][:password])
        sign_in(user)

        CartMerger.new(user, session).merge!

        redirect_to after_sign_in_path_for(user), notice: 'Successfully logged in!'
      else
        flash[:alert] = 'Invalid username or password'
        render :new
      end
    end

    def destroy
      super
    end
  end
end
