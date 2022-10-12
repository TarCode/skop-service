# frozen_string_literal: true

# Stores controller
class StoresController < ApplicationController
  before_action :authenticate_user!
  def index
    stores = Store.where(user: current_user)
    render json: stores
  end

  def show
    @store = Store.find(params[:id])
    render json: @store
  end

  def create
    store = Store.create!(name: store_params[:name], user: current_user)
    render json: { message: 'Store added', store: }
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end
end
