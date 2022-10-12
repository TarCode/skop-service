# frozen_string_literal: true

# Products controller
class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    products = Product.all
    render json: products, include: %i[store category prices]
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    product = Product.create!(product_params)
    render json: { message: 'Product added', product: }
  end

  private

  def product_params
    params.require(:product).permit(:name, :store_id, :category_id)
  end
end
