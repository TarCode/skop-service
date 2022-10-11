# frozen_string_literal: true

class Saleitem < ApplicationRecord
  belongs_to :product
  belongs_to :sale
end
