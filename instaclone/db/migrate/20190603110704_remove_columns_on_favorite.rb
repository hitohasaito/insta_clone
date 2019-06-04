class RemoveColumnsOnFavorite < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :user_id,:instagram_id
  end
end
