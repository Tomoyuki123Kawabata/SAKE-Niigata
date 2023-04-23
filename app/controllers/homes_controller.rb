class HomesController < ApplicationController
  def top
    @post_sakes = PostSake.all
  end
end
