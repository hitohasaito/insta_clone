class InstagramsController < ApplicationController
  before_action:set_insta,only:[:edit, :update, :destroy, :show]

  def new
    if params[:back]
      @instagram = Instagram.new(insta_params)
    else
      @instagram = Instagram.new
      @instagram.user_id = current_user.id
    end
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
    if @instagram.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to instagrams_path
    end
  end
  def update
    if @instagram.update(insta_params)
      redirect_to instagrams_path
    else
      render "edit"
    end
  end
  def destroy
    if @instagram.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to instagrams_path
    else
      @instagram.destroy
      redirect_to instagrams_path
    end
  end
  def show
    @favorite = current_user.favorites.find_by(instagram_id: @instagram.id)
  end
  def confirm
    @instagram = Instagram.new(insta_params)
    @instagram.user_id = current_user.id
    render "new" if @instagram.invalid?
  end


  private

  def insta_params
    params.require(:instagram).permit(:image, :image_cache, :content)
  end
  def set_insta
    @instagram = Instagram.find(params[:id])
  end
end
