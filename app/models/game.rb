class Game < ApplicationRecord
  before_validation :generate_game_name
  
  validates_presence_of :game_name, :room_id

  has_many :game_puzzles
  has_many :puzzles, through: :game_puzzles

  def end_game(room_id:, game_name:, time_seconds:)
    tear_down_game(room_id: room_id, game_name:game_name)
    leaderboard_message = Leaderboard.update_leaderboard(room_id: room_id, game_name: game_name, time_seconds: time_seconds)
  end

  private

  require 'faker'

  def generate_game_name
    a = Faker::Adjective.negative
    b = Faker::Color.color_name
    c = Faker::Games::Pokemon.name
    self.game_name = "#{a}-#{b}-#{c}"
  end

  def tear_down_game(room_id:, game_name:)
    game_to_remove = Game.where(room_id: room_id, game_name: game_name).first
    game_to_remove&.destroy
  end
  
end
