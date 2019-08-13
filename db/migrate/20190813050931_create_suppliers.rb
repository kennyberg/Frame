class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :address_line_1
      t.string :address_zipcode
      t.string :address_city
      t.string :country
      t.string :delivering_region

      t.timestamps
    end
  end
end
