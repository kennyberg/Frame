class FrameCombo < ApplicationRecord
  has_one :frame_material
  has_one :frame_dimension

  monetize :price_cents
end
