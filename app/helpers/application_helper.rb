module ApplicationHelper
  def nav_dashboard_path
    if user_signed_in?
      if current_user.admin?
        admin_dashboard_path
      else
        customer_dashboard_path
      end
    else
      root_path
    end
  end

  def active_class(path)
    "active" if request.path.start_with?(path)
  end

  def body_class
    if current_user.nil?
      "guest-page"
    end
  end

  def cart_items_count
    if user_signed_in?
      current_user.cart_item_count
    else
      (session[:cart] || {}).values.sum
    end
    # return 0 unless session[:cart]

    # session[:cart].values.sum
  end
end
