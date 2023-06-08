class Admin::HomesController < ApplicationController
  def top
    @post_sakes = PostSake.all
  end

  private
    # ストロングパラメータ
    def post_sake_params
      params.require(:post_sake).permit(:sake, :comment, :image)
    end
end
