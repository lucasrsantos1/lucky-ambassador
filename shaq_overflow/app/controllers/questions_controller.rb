class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to '/'

  end

  private 
    def question_params
      params.require(:question).permit(:user_id, :url, :title)
    end


end