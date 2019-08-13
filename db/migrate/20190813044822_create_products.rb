class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :photo, foreign_key: true
      t.references :frame_combo, foreign_key: true

      t.timestamps
    end
  end
end
