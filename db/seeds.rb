player1 = User.create(
    email: "ch33sybr3ad",
    first_name: "jason",
    last_name: "zhao"
  )

player2 = User.create(
    email: "euniceschoi",
    first_name: "eunice",
    last_name: "choi"
  )

game1 = Game.create(
    lat: 37.7833,
    lng: -122.4167,
    buy_in_amount: 40,
    table_size: 9,
    players: [2],
    host_id: 1,
    variation: "holdem"
  )