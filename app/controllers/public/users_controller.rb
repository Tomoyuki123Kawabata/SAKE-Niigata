class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update,:show,:index]
  
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
  
  def unsubscribe
  end
  
  def withdrawal
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
end
