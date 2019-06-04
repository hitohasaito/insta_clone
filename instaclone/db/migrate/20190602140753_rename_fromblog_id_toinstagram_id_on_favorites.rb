class RenameFromblogIdToinstagramIdOnFavorites < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites,:blog_id,:instagram_id
  end
end
