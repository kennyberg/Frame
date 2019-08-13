class CreateFrameDimensions < ActiveRecord::Migration[5.2]
  def change
    create_table :frame_dimensions do |t|
      t.integer :height
      t.integer :width
      t.string :format

      t.timestamps
    end
  end
end
