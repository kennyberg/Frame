class CreateFrameCombos < ActiveRecord::Migration[5.2]
  def change
    create_table :frame_combos do |t|
      t.references :frame_material, foreign_key: true
      t.references :frame_dimension, foreign_key: true
      t.monetize :price, currency: { present: false }

      t.timestamps
    end
  end
end
