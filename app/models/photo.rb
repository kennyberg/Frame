class Photo < ApplicationRecord
  mount_uploader :uploaded_url, PhotoUploader # CarrierWave

  belongs_to :user, optional: true
  has_many :wishlists
  has_many :users, through: :wishlists
  has_many :products
end
