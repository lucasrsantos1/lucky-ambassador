class CommentsController < ApplicationController

  def create
    comment = Comment.new(comments_params)
    comment.commentable_id = params[:question_id]
    comment.user_id = current_user.id
    comment.save
    redirect_to "/questions/#{comment.commentable_id}"
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
  end

end