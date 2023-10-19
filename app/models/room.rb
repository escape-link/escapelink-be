class Room < ApplicationRecord
  validates_presence_of :room_name, :number_puzzles

  has_many :leaderboards
  has_many :puzzles
  has_many :games
end