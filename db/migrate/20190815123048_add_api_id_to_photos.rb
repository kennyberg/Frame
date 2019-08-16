class AddApiIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :api_id, :string
  end
end
