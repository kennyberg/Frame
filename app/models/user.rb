class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders # a user can have many orders (including former ones)
  has_many :photos # photos uploaded by the user
  has_many :favorites # a user can have many wishlists
  has_many :carts # a user can only have one cart at a time
  has_many :cart_products, through: :carts
end
