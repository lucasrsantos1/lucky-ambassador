class VotesController < ApplicationController

  def create
    if params[:votableType] == "Answer"
      answer_votes
    end
  end

  def answer_votes
  if request.xhr?
      if params[:direction] == "up"
        vote = Vote.create(votable_type: params[:votableType], user_id: current_user.id, value: 1, votable_id: params[:answerId])
        @answer = Answer.find(params[:answerId])
      else
        vote = Vote.create(votable_type: params[:votableType], user_id: current_user.id, value: -1, votable_id: params[:answerId])
        @answer = Answer.find(params[:answerId])
      end
        x = @answer.net
        x.to_json
        render json: x
    end
  end

end