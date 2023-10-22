class Puzzle < ApplicationRecord
  validates_presence_of :room_id, :puzzle_identifier

  belongs_to :room
  has_many :game_puzzles
  has_many :games, through: :game_puzzles
end