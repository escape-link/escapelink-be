FactoryBot.define do
  factory :leaderboard do
    game_name { Faker::Adjective.positive + "-" + Faker::Color.color_name + "-" + Faker::Games::SonicTheHedgehog.character }
    room_id {}
    time_seconds { Faker::Number.between(from: 900, to: 3000)}
  end
end