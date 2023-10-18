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
      puzzle = Puzzle.create!(room_id: room.id)
      game = Game.create!(room_name: "shiny-blue-Charizard", room_id: room.id)

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
      puzzle = Puzzle.create!(room_id: room.id)

      gamepuzzle = GamePuzzle.new(puzzle_id: puzzle.id)

      expect(gamepuzzle).to_not be_valid
    end

    it "SAD PATH: should not validate with missing puzzle_id" do
      game = Game.create!(game_name: "shiny-blue-Charizard", room_id: room.id)

      gamepuzzle = GamePuzzle.new(game_id: game_id)

      expect(gamepuzzle).to_not be_valid
    end
  end
end