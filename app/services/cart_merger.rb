class CartMerger
  def initialize(user, session)
    @user = user
    @session_cart = session[:cart] || {}
  end

  def merge!
    return if @session_cart.empty?

    cart = @user.cart || @user.create_cart

    @session_cart.each do |product_id, quantity|
      product = Product.find_by(id: product_id)
      next unless product

      item = cart.cart_items.find_or_initialize_by(product_id: product_id)
      item.quantity = quantity.to_i
      item.unit_price = product.price
      item.save
    end

    @session_cart.clear
  end
end
