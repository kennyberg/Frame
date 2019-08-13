class AddStateToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :state, :string
  end
end
