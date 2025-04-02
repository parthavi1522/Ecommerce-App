class Order < ApplicationRecord
  belongs_to :user

  validates :user_id, :order_date, :shipping_address, presence: true
  validates :order_number, presence: true, uniqueness: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  enum :order_status, { pending: 0, shipped: 1, delivered: 2, canceled: 3 }, prefix: true
  enum :payment_status, { pending: 0, paid: 1, failed: 2, refunded: 3 }, prefix: :payment

  scope :pending, -> { where(order_status: 'pending') }
  scope :shipped, -> { where(order_status: 'shipped') }
  scope :delivered, -> { where(order_status: 'delivered') }
  scope :canceled, -> { where(order_status: 'canceled') }

  before_validation :generate_order_number, on: :create

  private

  def generate_order_number
    self.order_number ||= "ORD#{SecureRandom.hex(5).upcase}"
  end
end
