class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.references :user, foreign_key: true
      t.string :address_line_1
      t.string :address_zipcode
      t.string :address_city
      t.string :country
      t.string :phone_number
      t.string :state
      t.jsonb :payment
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
