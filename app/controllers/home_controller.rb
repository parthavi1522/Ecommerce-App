class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_to_admin

  def index
    @products_count_in_cart = 0
    if params[:query].present?
      @products = Product.with_attached_image.where("LOWER(name) LIKE :query OR LOWER(description) LIKE :query", query: "%#{params[:query].downcase}%")
    else
      @products = Product.with_attached_image.all
    end
  end

  private
  def redirect_to_admin
    redirect_to admin_dashboard_path if user_signed_in? && current_user.admin?
  end
end
