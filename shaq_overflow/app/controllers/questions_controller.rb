class QuestionsController < ApplicationController

  def index
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
  end


end