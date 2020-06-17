class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :genre_id, :integer, null: false
    add_column :products, :name, :string, null: false
    add_column :products, :image_id, :string
    add_column :products, :introduction, :string, null: false
    add_column :products, :price, :integer, null: false
    add_column :products, :sales_status, :boolean, default: false, null: false
  end
end
