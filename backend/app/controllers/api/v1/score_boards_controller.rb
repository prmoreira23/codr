class Api::V1::ScoreBoardsController < ApplicationController
  before_action :create_scoreboard, only: [:create]
  def create
    render json: @scoreboard
  end

  private
  def create_scoreboard
    @scoreboard = ScoreBoard.create(user_id: params[:user_id], quiz_id: params[:quiz_id], score: params[:score])
  end
end
