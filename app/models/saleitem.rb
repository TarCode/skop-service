# frozen_string_literal: true

class Saleitem < ApplicationRecord
  validates :price_in_cents, :qty, :product_id, presence: true
  belongs_to :product
  belongs_to :sale
end
