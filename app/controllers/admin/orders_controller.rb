module Admin
  class OrdersController < ApplicationController
    before_action :authorize_admin
    before_action :set_order, only: %i[ edit update destroy ]

    def index
      @orders = Order.all
    end

    def edit
    end

    def update
      if @order.update(order_params)
        redirect_to admin_orders_path, notice: "Order was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy!
      redirect_to admin_orders_path, notice: "Order was successfully destroyed."
    end

    private
      def set_order
        @order = Order.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_orders_path, alert: "Order not found."
      end

      def order_params
        params.require(:order).permit(:order_status, :payment_status)
      end
  end
end