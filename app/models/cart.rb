class Cart < ApplicationRecord
  belongs_to :user
  has_many :products

  monetize :total_price_cents
end
