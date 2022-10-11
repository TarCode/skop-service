# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :categories
  has_many :products
  has_many :sales
end
