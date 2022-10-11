# frozen_string_literal: true

# Stores controller
class StoresController < ApplicationController
  before_action :authenticate_user!
  def index
    stores = Store.where(user: current_user)
    render json: stores
  end
end
