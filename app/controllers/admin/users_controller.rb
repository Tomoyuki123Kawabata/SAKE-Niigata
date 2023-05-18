class Admin::UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
