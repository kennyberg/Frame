class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.monetize :total_price, currency: { present: false }

      t.timestamps
    end
  end
end
