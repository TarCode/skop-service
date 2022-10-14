# frozen_string_literal: true

class Sale < ApplicationRecord
  validates :total_in_cents, :unit, :store_id, presence: true
  belongs_to :store
  belongs_to :user
  has_many :saleitems
  has_many :products, through: :saleitems
end
