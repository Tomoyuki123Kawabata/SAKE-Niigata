class Public::PostCommentsController < ApplicationController
  
  def create
    post_sake = PostSake.find(params[:post_sake_id])
    #comment = current_user.post_comments.new(post_comment_params)
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_sake_id = post_sake.id
    comment.save
    redirect_to post_sake_path(post_sake)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_sake_path(params[:post_sake_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
