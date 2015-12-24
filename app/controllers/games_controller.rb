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
end
