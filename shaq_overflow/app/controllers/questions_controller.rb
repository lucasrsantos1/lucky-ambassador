class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    if params[:order] == "votes"
      @questions = Question.all.sort_by {|q| q.votes.count }.reverse
    elsif params[:order] == "trending"
      @questions = Question.all.sort_by {|q| [q.elapsed, -1 * q.votes.count] }
    else
      @questions = Question.order(created_at: :desc)
    end
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
      redirect_to root_url
    end
    @errors = display_errors!
  end

  def create
    @question = current_user.questions.build(question_params)
    @question.save

    unless @question.errors.messages.empty?
      parse_ar_errors_for_display!(@question.errors.messages)
      redirect_to new_question_url
    else
     redirect_to "/"
   end

  end

  private
    def question_params
      params.require(:question).permit(:url, :title)
    end

end