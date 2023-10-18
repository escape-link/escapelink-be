class Game < ApplicationRecord
  before_validation :generate_game_name
  
  validates_presence_of :game_name

  has_many :game_puzzles
  has_many :puzzles, through: :game_puzzles

  def end_game(finish_group_name, finish_score)
    tear_down_game(finish_group_name)
    leaderboard_message = Leaderboard.update_leaderboard(finish_group_name, finish_score)
  end

  private

  require 'faker'

  def generate_game_name
    a = Faker::Adjective.negative
    b = Faker::Color.color_name
    c = Faker::Games::Pokemon.name
    self.game_name = "#{a}-#{b}-#{c}"
  end

  def tear_down_game(game_name)
    game_to_remove = Game.find_by(game_name: room_name)
    game_to_remove.destroy
  end
end
