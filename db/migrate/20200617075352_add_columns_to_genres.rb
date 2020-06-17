class AddColumnsToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string
    add_column :genres, :genre_status, :boolean, default: false
  end
end
