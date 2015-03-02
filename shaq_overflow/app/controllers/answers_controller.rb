class AnswersController < ApplicationController

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
      #***************************
      #CHANGE THIS TO CURRENT USER
      #***************************
    @answer.user = User.find(1)
    @answer.question = Question.find(params[:question_id])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find params[:id]
    @question = Question.find(params[:question_id])
  end

  def update
    @answer = Answer.find params[:id]
    if @answer.update_attributes(answer_params)
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find params[:id]
    article.destroy
    redirect_to root_path
  end

private
  def answer_params
    params.require(:answer).permit(:content, :accepted)
  end
end