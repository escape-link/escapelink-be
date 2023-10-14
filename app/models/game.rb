class Game < ApplicationRecord
  before_validation :generate_room_name
  
  validates :puzzle_1_solved, :puzzle_2_solved, :puzzle_3_solved, :puzzle_4_solved, :puzzle_5_solved, :room_name, presence: true


  private

  require 'faker'

  def generate_room_name
    a = Faker::Adjective.negative
    b = Faker::Color.color_name
    c = Faker::Games::Pokemon.name
    self.room_name = "#{a}-#{b}-#{c}"
  end
end
