class Photo < ApplicationRecord
  mount_uploader :upload, PhotoUploader # CarrierWave

  belongs_to :user, optional: true
  has_many :favorites
  has_many :users, through: :favorites
  has_many :products
end
