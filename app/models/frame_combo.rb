class FrameCombo < ApplicationRecord
  belongs_to :frame_material
  belongs_to :frame_dimension

  monetize :price_cents
end
