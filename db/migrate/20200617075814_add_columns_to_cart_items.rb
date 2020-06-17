class AddColumnsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :user_id, :integer, null: false
    add_column :cart_items, :product_id, :integer, null: false
    add_column :cart_items, :quantity, :integer, default: 1, null: false
  end
end
