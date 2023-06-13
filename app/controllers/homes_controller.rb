class HomesController < ApplicationController
  def top
    @post_sakes = PostSake.page(params[:page]) #kaminariでのページネーション
  end
end
