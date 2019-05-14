class InstagramsController < ApplicationController
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


  private
  def insta_params
    params.require(:instagram).permit(:image, :image_cache, :content)
  end
end
