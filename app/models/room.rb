class Room < ApplicationRecord
  validates_presence_of :room_name, :number_puzzles
end