class AddColumnsToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string, null: false
    add_column :genres, :genre_status, :boolean, default: false, null: false
  end
end
