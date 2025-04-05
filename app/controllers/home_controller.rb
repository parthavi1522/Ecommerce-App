class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_to_admin

  def index
    @product_count_in_cart = 0
  end

  private
  def redirect_to_admin
    redirect_to admin_dashboard_path if user_signed_in? && current_user.admin?
  end
end
