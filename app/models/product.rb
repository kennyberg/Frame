class Product < ApplicationRecord
  belongs_to :photo
  belongs_to :frame_combo
  has_one :cart_product

  monetize :price_cents
end

