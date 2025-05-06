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
  end

  def order_status_badge(order)
    badge_class = case order.order_status
                  when "delivered" then "bg-success"
                  when "cancelled" then "bg-danger"
                  when "shipped" then "bg-warning"
                  else "bg-primary"
                  end

    content_tag(:span, order.order_status.capitalize, class: "badge #{badge_class}")
  end

  def payment_status_badge(order)
    badge_class = case order.payment_status
                  when "paid" then "bg-success"
                  when "failed" then "bg-danger"
                  when "refunded" then "bg-info"
                  else "bg-secondary"
                  end
  
    content_tag(:span, order.payment_status.capitalize, class: "badge #{badge_class}")
  end
end
