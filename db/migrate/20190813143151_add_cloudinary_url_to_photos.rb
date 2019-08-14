class AddCloudinaryUrlToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :cl_url, :string
  end
end
