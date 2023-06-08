class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @post_sakes = @user.post_sakes
  end

  private
    # ストロングパラメータ
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
