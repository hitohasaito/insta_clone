class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update]
  before_action :authenticate_user,only:[:show,:edit]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
      flash[:notice] = "アカウントが登録されました！ログインしてください"
    else
      render "new"
    end
  end
  def show
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path,  notice: "プロフィールを編集しました！"
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profimage, :profimage_cache)
  end
  def set_user
    @user = User.find(params[:id])
  end
  def match_user
    @instagram = Instagram.find(params[:id])
    if @instagram.user_id != current_user.id
      redirect_to instagrams_path
      flash[:notice] = "権限がありません"
    end
  end
end
