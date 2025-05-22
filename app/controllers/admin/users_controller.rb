module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin
    before_action :set_user, only: %i[ edit update destroy ]

    def index
      @users = User.customers
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy!
      redirect_to admin_users_path, notice: "User was successfully destroyed."
    end

    private
      def set_user
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_users_path, alert: "User not found."
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :mobile_number, :profile)
      end
  end
end