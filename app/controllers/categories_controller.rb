# frozen_string_literal: true

# Categories controller
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    categories = Category.all
    render json: categories
  end
end
