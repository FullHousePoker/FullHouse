class GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def nearby_games
    lng = params["lng"]
    lat = params["lat"]
    debugger
  end
end
