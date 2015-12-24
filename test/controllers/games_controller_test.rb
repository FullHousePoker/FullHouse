require 'test_helper'

class GamesControllerTest < ActionController::TestCase

  test "#nearby_games returns nearby games with dublin lng and lat" do
    dublin_game = games(:dublin)

    get :nearby_games, lat: 37.7760073, lng: -121.9432572

    games = JSON.parse(response.body)

    assert_equal 1, games.count

    assert_equal dublin_game.id, games.first["id"]
    assert_equal dublin_game.table_size, games.first["table_size"]
    assert_equal dublin_game.host_id, games.first["host_id"]
  end

  test "#index returns all games" do
    get :index

    games = JSON.parse(response.body)

    assert_equal 2, games.count
  end

  test '#create creates game' do
    game_params = {
      lat: 180,
      lng: 180,
      buy_in_amount: 40,
      table_size: 9,
      players: [2],
      host_id: 1,
      variation: "holdem"
    }

    post :create, game: game_params

    game = JSON.parse(response.body)

    assert_equal game_params[:lat], game["lat"]
    assert_equal game_params[:lng], game["lng"]
    assert_equal game_params[:buy_in_amount], game["buy_in_amount"]
    assert_equal game_params[:host_id], game["host_id"]
    assert_equal game_params[:variation], game["variation"]
  end

  test '#update updates game' do
    game = games(:dublin)
    game_params = {
      table_size: 8
    }

    put :update, game: game_params, id: game.id

    game = JSON.parse(response.body)

    assert_equal game_params[:table_size], game['table_size']
  end

  test '#destroy destroys game' do
    game = games(:dublin)

    assert_difference 'Game.count', -1 do
      delete :destroy, id: game.id
    end

    assert_response 204
  end
end
