class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    products = Product.all
    render json: products, include: %i[store category]
  end
end
