class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    set_session
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { render json: :user, status: :logged, location: @user }
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end