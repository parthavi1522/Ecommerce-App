class Admin::DashboardsController < ApplicationController
  before_action :authorize_admin

  def index
    @total_customers = User.customers.count
    @total_products = Product.count
    @total_orders = Order.count
    @recent_orders = Order.includes(:user, order_items: :product).order(created_at: :desc).limit(10)
  end
end
