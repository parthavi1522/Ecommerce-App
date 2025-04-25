class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  before_save :set_total_price

  def set_total_price
    self.total_price = self.quantity * self.unit_price
  end
end
