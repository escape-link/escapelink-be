class Game < ApplicationRecord
  before_validation :generate_game_name, if: :new_record? 
  after_create :generate_game_puzzles 
  after_create :start_timer
  
  validates_presence_of :game_name, :room_id

  has_many :game_puzzles
  has_many :puzzles, through: :game_puzzles

  def end_game(room_id:, game_name:)
    game = Game.find_by(game_name: game_name)
    time_seconds = game.stop_timer(game_name: game_name)
    tear_down_game(room_id: room_id, game_name:game_name)
    leaderboard_message = Leaderboard.update_leaderboard(room_id: room_id, game_name: game_name, time_seconds: time_seconds)
  end

  def stop_timer(game_name:)
    game = Game.find_by(game_name: game_name)
    end_time = DateTime.now.utc
    start_time = game.start_time
    time_seconds = (end_time - start_time)
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

  def start_timer
    self.update(start_time: Time.now)
  end

  def generate_game_puzzles
    puzzles = Puzzle.where(room_id: self.room_id)

    puzzles.each do |puzzle|
      GamePuzzle.create!(game_id: self.id, puzzle_id: puzzle.id, puzzle_solved: 0)
    end
  end
end
