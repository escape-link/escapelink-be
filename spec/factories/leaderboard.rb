FactoryBot.define do
  factory :leaderboard do
    room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
    room_id { room.id }
    game_name { Faker::Adjective.positive + "-" + Faker::Color.color_name + "-" + Faker::Games::SonicTheHedgehog.character }
    time_seconds { Faker::Number.between(from: 900, to: 3000)}
  end
end