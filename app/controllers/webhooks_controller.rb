class WebhooksController < ApplicationController
  protect_from_forgery except: :stripe

  def stripe
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
  
    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials.dig(:stripe, :webhook_secret)
      )
    rescue JSON::ParserError
      return render json: { error: 'Invalid payload' }, status: 400
    rescue Stripe::SignatureVerificationError
      return render json: { error: 'Invalid signature' }, status: 400
    end
  
    case event.type
    when 'checkout.session.completed'
      update_order_status(event.data.object.metadata.order_id, :paid, :pending)
  
    when 'checkout.session.async_payment_failed'
      update_order_status(event.data.object.metadata.order_id, :failed, :canceled)
  
    when 'payment_intent.payment_failed'
      update_order_status(event.data.object.metadata.order_id, :failed, :canceled)
    end
  
    render json: { message: 'success' }, status: 200
  end
  
  private
  
  def update_order_status(order_id, payment_status, order_status)
    order = Order.find_by(id: order_id)
    return unless order.present?
  
    order.update(payment_status: payment_status, order_status: order_status)
  end
end
