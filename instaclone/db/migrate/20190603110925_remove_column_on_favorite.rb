class RemoveColumnOnFavorite < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :instagram_id
  end
end
