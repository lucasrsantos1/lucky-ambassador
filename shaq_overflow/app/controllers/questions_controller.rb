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
    if is_authenticated?
      @question = Question.new
    else 
      add_error!("User must log in before creating post.")
      redirect_to '/login'
    end
  end

  def create
    @question = Question.new(question_params)
    @question.save
    
    unless @question.errors.messages.empty?
      parse_ar_errors_for_display!(@question.errors.messages) 
      redirect_to new_question
    else
     redirect_to "/"
   end
    

  end

  private 
    def question_params
      params.require(:question).permit(:user_id, :url, :title)
    end


end