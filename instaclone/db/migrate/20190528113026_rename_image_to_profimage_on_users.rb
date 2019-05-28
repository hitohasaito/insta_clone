class RenameImageToProfimageOnUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column:users, :image, :profimage
  end
end
