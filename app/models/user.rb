class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders # a user can have many orders (including former ones)
  has_many :photos # photos uploaded by the user
  has_many :photos, through: :wishlists # photos that the user has in his wishlist
  has_many :wishlists # a user can have many wishlists
  has_one :cart # a user can only have one cart at a time
end
