class Api::V1::QuizzesController < ApplicationController
  before_action :create_quiz, only: [:show]
  def show
    render json: @quiz
  end

  private
  def create_quiz
    @quiz = Quiz.create(user_id: params[:user_id], questions: Question.get_random_questions(5))
  end
end
