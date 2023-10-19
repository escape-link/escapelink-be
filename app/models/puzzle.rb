class Puzzle < ApplicationRecord
  validates_presence_of :room_id

  belongs_to :room
  has_many :game_puzzles
  has_many :games, through: :game_puzzles
end