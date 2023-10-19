require "rails_helper"

RSpec.describe GamePuzzle, type: :model do
  describe "validations" do
    it { should validate_presence_of(:puzzle_id) }
    it { should validate_presence_of(:game_id) }
  end

  describe "relationships" do
    it { should belong_to :puzzle }
    it { should belong_to :game }
  end

  describe "#initialize" do
    it "HAPPY PATH: should initialize with attributes" do
      room_name = "where's bob?"
      number_puzzles = 5
      room = Room.create!(room_name: room_name, number_puzzles: number_puzzles)
      puzzle = Puzzle.create!(room_id: room.id, puzzle_identifier: 5)
      game = Game.create!(game_name: "shiny-blue-Charizard", room_id: room.id)

      gamepuzzle = GamePuzzle.create!(game_id: game.id, puzzle_id: puzzle.id)

      expect(gamepuzzle).to be_valid
      expect(gamepuzzle.game_id).to eq(game.id)
      expect(gamepuzzle.puzzle_id).to eq(puzzle.id)
      expect(gamepuzzle.puzzle_solved).to eq(0)
    end

    it "SAD PATH: should not validate with missing game_id" do
      number_puzzles = 5
      room_name = "where's bob?"
      room = Room.create!(room_name: room_name, number_puzzles: number_puzzles)
      puzzle = Puzzle.create!(room_id: room.id, puzzle_identifier: 4)

      gamepuzzle = GamePuzzle.new(puzzle_id: puzzle.id)

      expect(gamepuzzle).to_not be_valid
    end

    it "SAD PATH: should not validate with missing puzzle_id" do
      number_puzzles = 5
      room_name = "where's bob?"
      room = Room.create!(room_name: room_name, number_puzzles: number_puzzles)
      puzzle = Puzzle.create!(room_id: room.id, puzzle_identifier: 4)
      game_name = "shiny-blue-Charizard"
      game = Game.create!(game_name: game_name, room_id: room.id)
      gamepuzzle = GamePuzzle.new(puzzle_id: puzzle.id)

      expect(gamepuzzle).to_not be_valid
    end
  end

  describe "#update_puzzle" do
    it "HAPPY PATH: can update a puzzle" do
      room_name = "where's bob?"
      number_puzzles = 5
      room = Room.create!(room_name: room_name, number_puzzles: number_puzzles)
      puzzle_1 = Puzzle.create!(room_id: room.id, puzzle_identifier: 1)
      game = Game.create!(room_id: room.id)
      game_puzzle = GamePuzzle.first

      expect(game_puzzle).to be_valid
      expect(game_puzzle.puzzle_solved).to eq(0)

      game_puzzle.update_puzzle(room_name: room_name, puzzle_identifier: 1, game_name: game.game_name)

      game_puzzle = GamePuzzle.first 
      
      expect(game_puzzle.puzzle_solved).to eq(1)
    end
  end
end