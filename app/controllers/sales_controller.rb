# frozen_string_literal: true

# Sales controller
class SalesController < ApplicationController
  before_action :authenticate_user!
  def index
    sales = Sale.where(user: current_user)
    render json: sales, include: %i[saleitems products]
  end

  def show
    @sale = Sale.find(params[:id])
    render json: @sale
  end

  def create
    new_sale = sale_params[:sale]
    new_saleitems = sale_params[:saleitems]

    ActiveRecord::Base.transaction do
      sale = create_sale(new_sale)
      create_saleitems(new_saleitems, sale)
    end
    render json: { message: 'Sale added' }
  rescue ActiveRecord::RecordInvalid => e
    render json: { message: "Error adding sale: #{e.message}" }, status: :bad_request
  end

  private

  def sale_params
    params.require(:sale_with_items)
          .permit(
            sale: %i[total_in_cents unit store_id],
            saleitems: %i[price_in_cents qty product_id]
          )
  end

  def create_sale(sale)
    Sale.create!(
      total_in_cents: sale[:total_in_cents],
      unit: sale[:unit],
      store_id: sale[:store_id],
      user: current_user
    )
  end

  def create_saleitems(saleitems, sale)
    saleitems.each do |saleitem|
      Saleitem.create!(
        price_in_cents: saleitem[:price_in_cents],
        qty: saleitem[:qty],
        sale:,
        product_id: saleitem[:product_id]
      )
    end
  end
end
