module Admin
  class ProductsController < ApplicationController
    before_action :authorize_admin
    before_action :set_product, only: %i[ edit update destroy ]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
  
      if @product.save
        redirect_to admin_products_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "Product was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product.destroy!
      redirect_to admin_products_path, notice: "Product was successfully destroyed."
    end

    private
      def set_product
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_products_path, alert: "Product not found."
      end

      def product_params
        params.require(:product).permit(:name, :price, :description, :image)
      end
  end
end