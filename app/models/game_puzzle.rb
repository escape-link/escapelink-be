class GamePuzzle < ApplicationRecord
  validates_presence_of :game_id, :puzzle_id, :puzzle_solved

  belongs_to :puzzle
  belongs_to :game
end