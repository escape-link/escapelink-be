require "rails_helper"

RSpec.describe Puzzle, type: :model do
  describe "validations" do
    it { should validate_presence_of(:room_id) }
  end

  describe "relationships" do
    it { should belong_to(:room) }
    it { should have_many(:games).through(:game_puzzles) }
  end

  describe "#initialize" do
    it "HAPPY PATH: should initialize with a room_id" do
      room_name = "where's bob?"
      number_puzzles = 5
      room = Room.create!(room_name: room_name, number_puzzles: number_puzzles)
      puzzle = Puzzle.new(room_id: room.id)

      expect(puzzle).to be_valid
      expect(puzzle.room_id).to eq(room.id)
    end

    it "SAD PATH: should not initialize without a room id" do
      puzzle = Puzzle.new

      expect(puzzle).to_not be_valid
    end
  end
end