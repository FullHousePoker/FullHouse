require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test 'game must have a valid variation' do
    game = Game.create(
        lat: 180,
        lng: 180,
        buy_in_amount: 40,
        table_size: 9,
        players: [2],
        host_id: 1,
        variation: "wrong"
      )

    assert_equal "Invalid variation poker variation is invalid", game.errors.full_messages.to_sentence
  end

end
