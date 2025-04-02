class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @product_count_in_cart = 0
  end
end
