class GamesController < ApplicationController

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
    @game = Game.create(game_params)
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
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
      :variation
      )
  end
end
