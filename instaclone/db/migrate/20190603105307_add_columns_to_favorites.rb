class AddColumnsToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column:favorites, :user_id, :string
    add_column:favorites, :instagram_id, :string
  end
end
