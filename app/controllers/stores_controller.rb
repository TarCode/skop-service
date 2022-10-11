class StoresController < ApplicationController
  before_action :authenticate_user!
  def index
    stores = Store.all
    render json: stores
  end
end
