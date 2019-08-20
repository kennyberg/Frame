class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites
  has_many :orders # a user can have many orders (including former ones)
  has_many :photos # photos uploaded by the user
  has_many :wishlists # a user can have many wishlists
  has_many :carts # a user can only have one cart at a time
  has_many :cart_products, through: :carts

  def has_favorite_photo?(id)
    photo = Photo.where(api_id: id).first
    return false if photo.nil?
    Favorite.where(user: self, photo_id: photo.id).any?
  end

  def favorite_id(id)
    photo = Photo.where(api_id: id).first
    Favorite.where(user: self, photo_id: photo.id).first.id
  end
end
