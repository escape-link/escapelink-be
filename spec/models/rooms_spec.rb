require "rails_helper"

RSpec.describe Room, type: :model do
  describe "validations" do
    it { should validate_presence_of(:room_name) }
    it { should validate_presence_of(:number_puzzles) }
  end

  describe "relationships" do
    it { should have_many :leaderboards }
    it { should have_many :puzzles }
    it { should have_many :games }
  end

  describe "#initialize" do
    it "should initialize" do
      room_name = "where's bob?"
      number_puzzles = 5
      room = Room.new(room_name: room_name, number_puzzles: number_puzzles)

      expect(room).to be_valid
      expect(room.room_name).to eq(room_name)
      expect(room.number_puzzles).to eq(number_puzzles)
    end

    it "should not initialize with missing information" do
      number_puzzles = 5
      room = Room.new(number_puzzles: number_puzzles)

      expect(room).to_not be_valid

      room_name = "where's bob?"
      room = Room.new(room_name: room_name)

      expect(room).to_not be_valid
    end
  end
end