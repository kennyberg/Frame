class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  monetize :total_price_cents
end
