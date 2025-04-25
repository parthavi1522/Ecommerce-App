class PaymentsController < ApplicationController
  def create_checkout_session
    order = Order.find(params[:order_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: "Order ##{order.id}",
          },
          unit_amount: order.total_amount_cents,
        },
        quantity: 1,
      }],
      success_url: order_success_url(order),
      cancel_url: order_cancel_url(order)
    )

    redirect_to session.url, allow_other_host: true
  end
end
