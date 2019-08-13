class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :height
      t.integer :width
      t.text :description
      t.string :upload
      t.string :api_url
      t.string :photographer_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
