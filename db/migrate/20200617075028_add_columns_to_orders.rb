class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer, null: false
    add_column :orders, :payment, :integer, null: false
    add_column :orders, :address_name, :string, null: false
    add_column :orders, :postage, :integer, default:800, null: false
    add_column :orders, :postal_code, :string, null: false
    add_column :orders, :address, :string, null: false
    add_column :orders, :price, :integer, null: false
    add_column :orders, :order_status, :integer, default:1, null: false
  end
end
