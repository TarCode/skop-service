# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  has_many :prices
end
