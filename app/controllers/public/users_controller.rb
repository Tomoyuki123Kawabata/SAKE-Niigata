class Public::UsersController < ApplicationController
  
  def index
    
  end
  def show
    @user = User.find(params[:id]) 
    @post_sakes = @user.post_sakes #ユーザーの投稿をすべて取得
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
