require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "#nearby_games returns nearby games with valid lng and lat" do
    get :nearby_games, lat: 37.7760073, lng: -121.9432572
      debugger
  end
end
