class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
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

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name
      )
  end
end
