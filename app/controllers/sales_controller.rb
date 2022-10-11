# frozen_string_literal: true

# Sales controller
class SalesController < ApplicationController
  before_action :authenticate_user!
  def index
    sales = Sale.where(user: current_user)
    render json: sales, include: %i[saleitems products]
  end
end
