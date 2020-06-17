class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :genre_id, :integer
    add_column :products, :name, :string
    add_column :products, :image_id, :string
    add_column :products, :introduction, :string
    add_column :products, :price, :integer
    add_column :products, :sales_status, :boolean, default: false, null: false
  end
end
