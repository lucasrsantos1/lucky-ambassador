class VotesController < ApplicationController

  def create
    if request.xhr?
      if params[:direction] == "up"
        vote = Vote.create(votable_type: params[:votableType], user_id: current_user.id, value: 1, votable_id: params[:answerId])
        @answer = Answer.find(params[:answerId])
      else
        vote = Vote.create(votable_type: params[:votableType], user_id: current_user.id, value: -1, votable_id: params[:answerId])
        @answer = Answer.find(params[:answerId])
      end
        @vote_values = []
        @answer.votes.each {|vote| @vote_values << vote.value.to_i}
           @anna = @vote_values.reduce(:+)
        @anna.to_json
        render json: @anna
    end
  end

end