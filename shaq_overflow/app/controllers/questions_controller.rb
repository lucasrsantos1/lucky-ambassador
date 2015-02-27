class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
  end


end