# frozen_string_literal: true

# Categories controller
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    categories = Category.all
    render json: categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    category = Category.create!(category_params)
    render json: { message: 'Category added', category: }
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
