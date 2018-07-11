class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show]
  def show
    render json: @user
  end

  private
  def find_user
    @user = User.find_or_create_by(username: params[:username])
  end
end
