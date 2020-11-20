class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/spots/#{comment.spot.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
