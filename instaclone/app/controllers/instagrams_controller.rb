class InstagramsController < ApplicationController
  before_action:set_insta,only:[:edit, :update, :destroy, :show]

  def new
    @instagram = Instagram.new
  end
  def create
    @instagram = Instagram.new(insta_params)
    @instagram.user_id = current_user.id
    if @instagram.save
      InstagramMailer.instagram_mail(@instagram).deliver
      redirect_to instagrams_path
    else
      render 'new'
    end
  end
  def index
    @instagrams = Instagram.all
  end
  def edit
  end
  def update
    if @instagram.update(insta_params)
      redirect_to instagrams_path
    else
      render "edit"
    end
  end
  def destroy
    @instagram.destroy
    redirect_to instagrams_path, notice:"投稿を削除しました"
  end
  def show
    @favorite = current_user.favorites.find_by(instagram_id: @instagram.id)
  end


  private
  def insta_params
    params.require(:instagram).permit(:image, :image_cache, :content)
  end
  def set_insta
    @instagram = Instagram.find(params[:id])
  end
end
