class AddOrientationToFrameDimensions < ActiveRecord::Migration[5.2]
  def change
    add_column :frame_dimensions, :orientation, :string
  end
end
