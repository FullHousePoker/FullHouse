player1 = User.create(
    username: "ch33sybr3ad",
    password: 123456,
    first_name: "jason",
    last_name: "zhao" 
  )

player2 = User.create(
    username: "euniceschoi",
    password: 123456,
    first_name: "eunice",
    last_name: "choi" 
  )

game1 = Game.create(
    lat: 180,
    lng: 180,
    buy_in_amount: 40,
    table_size: 9,
    players: [2],
    host_id: 1,
    variation: "holdem"
  )