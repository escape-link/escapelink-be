class Game < ApplicationRecord
  before_validation :generate_room_name
  
  validates :puzzle_1_solved, :puzzle_2_solved, :puzzle_3_solved, :puzzle_4_solved, :puzzle_5_solved, :room_name, presence: true

  def end_game(finish_group_name, finish_score)
    tear_down_game(finish_group_name)
    leaderboard_message = Leaderboard.update_leaderboard(finish_group_name, finish_score)
  end

  private

  require 'faker'

  def generate_room_name
    a = Faker::Adjective.negative
    b = Faker::Color.color_name
    c = Faker::Games::Pokemon.name
    self.room_name = "#{a}-#{b}-#{c}"
  end

  def tear_down_game(room_name)
    game_to_remove = Game.find_by(room_name: room_name)
    game_to_remove.destroy
  end
end
