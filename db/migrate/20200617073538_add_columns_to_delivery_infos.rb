class AddColumnsToDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_infos, :user_id, :integer
    add_column :delivery_infos, :address_name, :string
    add_column :delivery_infos, :postal_code, :string
    add_column :delivery_infos, :address, :string
  end
end
