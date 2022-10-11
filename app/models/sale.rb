# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_many :saleitems
  has_many :products, through: :saleitems
end
