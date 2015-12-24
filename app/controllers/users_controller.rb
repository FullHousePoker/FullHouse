class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token
  before_filter :add_cors_to_json


  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.find_or_create_by(user_params)
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing: true, status: 204
  end

  protected 

  def add_cors_to_json
    response.headers["Access-Control-Allow-Origin"] = "*"
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name
      )
  end
end
