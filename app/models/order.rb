class Order < ApplicationRecord
  has_one :cart
  belongs_to :user
  belongs_to :supplier
  # has_many :products, through: :carts # do we need that or not?
end
