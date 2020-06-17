class AddColumnsToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :order_id, :integer, null: false
    add_column :order_details, :product_id, :integer, null: false
    add_column :order_details, :price, :integer, null: false
    add_column :order_details, :quantity, :integer, default: 1, null: false
    add_column :order_details, :product_status, :integer, default: 1, null: false
  end
end
