class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer
    add_column :orders, :payment, :integer
    add_column :orders, :address_name, :string
    add_column :orders, :postage, :integer, default:800
    add_column :orders, :postal_code, :string
    add_column :orders, :address, :string
    add_column :orders, :price, :integer
    add_column :orders, :order_status, :integer, default:1
  end
end
