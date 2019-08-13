class FrameCombo < ApplicationRecord
  belongs_to :frame_material
  belongs_to :frame_dimension
  has_many :products

  monetize :price_cents
end
