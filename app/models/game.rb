class Game < ApplicationRecord
  validates_presence_of :puzzle_1_solved, :puzzle_2_solved, :puzzle_3_solved, :puzzle_4_solved, :puzzle_5_solved
end
