class CartBuilder
  def initialize(user, session)
    @user = user
    @session = session
  end

  def build_items
    return build_user_cart_items if @user.present?

    (@session[:cart] || {}).each_with_object([]) do |(product_id, quantity), items|
      product = Product.find_by(id: product_id)
      items << { product: product, quantity: quantity.to_i } if product
    end
  end

  private

  def build_user_cart_items
    @user.cart&.cart_items&.includes(:product)&.map do |item|
      { product: item.product, quantity: item.quantity } if item.product
    end.compact || []
  end
end
