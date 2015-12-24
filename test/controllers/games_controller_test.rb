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
end
