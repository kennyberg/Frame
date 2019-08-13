class Cart < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :cart_products
  has_many :products, through: :cart_products

  monetize :total_price_cents
end
