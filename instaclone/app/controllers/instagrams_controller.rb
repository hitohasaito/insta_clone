class InstagramsController < ApplicationController
  before_action:set_insta,only:[:edit,:update]
  def new
    @instagram = Instagram.new
  end
  def create
    @instagram = Instagram.new(insta_params)
    if @instagram.save
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



  private
  def insta_params
    params.require(:instagram).permit(:image, :image_cache, :content)
  end
  def set_insta
    @instagram = Instagram.find(params[:id])
  end
end
