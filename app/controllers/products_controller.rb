class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, include: %i[store category]
  end
end
