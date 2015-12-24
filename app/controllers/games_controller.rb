class GamesController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token

  def index
    @games = Game.all
    render json: @games
  end

  def nearby_games
    lng = params["lng"]
    lat = params["lat"]

    @games = Game.near([lat, lng], 20)
    render json: @games
  end

  def create
    @game = Game.new(game_params)
    @game.geolocation = false

    @game.save
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    @game.assign_attributes(game_params)
    @game.geolocation = false

    @game.save
    render json: @game
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render nothing: true, status: 204
  end

  private

  def game_params
    params.require(:game).permit(
      :lat,
      :lng,
      :buy_in_amount,
      :table_size,
      :players,
      :host_id,
      :variation,
      :date_time
      )
  end
end
