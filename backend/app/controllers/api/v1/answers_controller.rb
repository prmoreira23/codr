class Api::V1::AnswersController < ApplicationController
  before_action :create_answer, only: [:create]
  def create
    render json: @answer
  end

  private
  def create_answer
    @answer = Answer.create(question_id: params[:question_id], quiz_id: params[:quiz_id], user_answer: params[:user_answer])
  end
end
