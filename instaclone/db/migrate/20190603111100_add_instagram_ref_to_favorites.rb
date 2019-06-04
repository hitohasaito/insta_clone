class AddInstagramRefToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :instagram, foreign_key: true
  end
end
