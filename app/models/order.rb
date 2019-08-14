class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  # belongs_to :supplier -> let's do that later if we can
  monetize :amount_cents
end
