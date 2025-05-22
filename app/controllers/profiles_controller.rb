class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update ]

  def show
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: "Profile updated successfully"
    else
      render :edit
    end
  end

  private
    def set_profile
      @user = current_user
    rescue ActiveRecord::RecordNotFound
      redirect_to customer_dashboard_path, alert: "User not found."
    end

    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :username, :email, :mobile_number, :address, :profile, :password
      )
    end
end
