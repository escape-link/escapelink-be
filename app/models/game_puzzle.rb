class GamePuzzle < ApplicationRecord
  validates_presence_of :game_id, :puzzle_id, :puzzle_solved

  belongs_to :puzzle
  belongs_to :game

  def update_puzzle(room_name:, puzzle_identifier:, game_name:)
    game = Game.find_by(game_name: game_name)
    room = Room.find_by(room_name: room_name)
    puzzle = Puzzle.find_by(puzzle_identifier: puzzle_identifier, room_id: room.id)
    game_puzzle = GamePuzzle.find_by(puzzle_id: puzzle.id, game_id: game.id)
    
    game_puzzle.update(puzzle_solved: 1)
  end
end