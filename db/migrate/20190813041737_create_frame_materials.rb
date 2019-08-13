class CreateFrameMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :frame_materials do |t|
      t.string :name

      t.timestamps
    end
  end
end
