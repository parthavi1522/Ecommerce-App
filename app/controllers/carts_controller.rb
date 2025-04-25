class CartsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_cart

  def add
    product_id = params[:product_id].to_s
    product = Product.find_by(id: product_id)

    return redirect_to root_path, alert: 'Product not found' unless product

    if user_signed_in?
      item = @cart.cart_items.find_or_initialize_by(product_id: product_id)
      item.quantity = item.new_record? ? 1 : item.quantity + 1
      item.unit_price = product.price
      item.save
    else
      session[:cart] ||= {}
      session[:cart][product_id] = session[:cart][product_id].to_i + 1
    end

    redirect_to root_path, notice: 'Product added to cart!'
  end

  def show
    @cart_items = CartBuilder.new(current_user, session).build_items
  end

  def remove
    product_id = params[:product_id].to_s

    if user_signed_in?
      @cart.cart_items.find_by(product_id: product_id)&.destroy
    else
      session[:cart]&.delete(product_id)
    end

    redirect_to carts_path, notice: 'Item removed from cart.'
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart if user_signed_in?
  end
end
