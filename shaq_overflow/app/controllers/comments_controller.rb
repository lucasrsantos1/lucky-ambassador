class CommentsController < ApplicationController

  def create
    comment = Comment.new(comments_params)
    comment.commentable_id = params[:question_id]
    comment.commentable_type = "Question"
    comment.save
    redirect_to '/'
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
  end

end