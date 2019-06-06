class FavoritesController < ApplicationController
  def create
    favorite = @current_user.favorites.create(instagram_id: params[:instagram_id])
    redirect_to favorites_path, notice: "#{favorite.instagram }さんのブログをお気に入り登録しました"
  end
  def index
    @user = User.find_by(id: @instagram.user_id)
    @favorites = Favorite.all
  end
  def destroy
    favorite = @current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "#{favorite.instagram }さんのブログをお気に入り解除しました"
  end
end
