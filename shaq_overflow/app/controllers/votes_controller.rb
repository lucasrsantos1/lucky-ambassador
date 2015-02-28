class VotesController < ApplicationController

  def create
    if request.xhr?
      vote = Vote.create(votable_type: params[:votableType], user_id: current_user.id, value: 1, votable_id: params[:answerId])
      answer = Answer.find(params[:answerId])
      votes = answer.votes.count
      votes.to_json
      render json: votes
    end
  end

end