class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :load_cart_items, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build(order_params.merge(
      total_price: @cart_items.sum { |i| i[:product].price * i[:quantity] },
      order_status: 'pending',
      payment_status: 'pending',
      order_date: Date.today
    ))

    if @order.save
      create_order_items(@order)
      cleanup_cart

      stripe_session = build_stripe_session(@order)
      redirect_to stripe_session.url, allow_other_host: true
    else
      redirect_to carts_path, alert: 'Could not place order'
    end
  end

  def success
    if (@order = Order.find_by(id: params[:id]))&.payment_pending?
      @order.update(payment_status: :paid, order_status: :pending)
    end
  end

  def cancel
    @order = Order.find_by(id: params[:id])
    if @order&.update(order_status: "cancelled", payment_status: "pending")
      flash[:notice] = "Your order has been cancelled successfully."
    else
      flash[:alert] = "Something went wrong. Please try again."
    end
    redirect_to customer_dashboard_path
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_items = @order.order_items.includes(:product)
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address, :payment_method)
  end

  def load_cart_items
    @cart_items = CartBuilder.new(current_user, session).build_items
    return redirect_to carts_path, alert: 'Your cart is empty' if @cart_items.empty?
  end

  def create_order_items(order)
    @cart_items.each do |item|
      order.order_items.create(
        product: item[:product],
        quantity: item[:quantity],
        total_price: item[:product].price
      )
    end
  end

  def cleanup_cart
    current_user.cart.cart_items.destroy_all if user_signed_in?
    session[:cart] = nil
  end

  def build_stripe_session(order)
    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: order.order_items.map do |item|
        {
          price_data: {
            currency: 'inr',
            product_data: { name: item.product.name },
            unit_amount: (item.total_price * 100).to_i,
          },
          quantity: item.quantity
        }
      end,
      mode: 'payment',
      success_url: order_success_url(order.id),
      cancel_url: order_cancel_url(order.id),
      metadata: { order_id: order.id },
      billing_address_collection: 'required',
    )
  end
end
