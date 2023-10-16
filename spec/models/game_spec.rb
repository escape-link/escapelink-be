require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "validations" do
    it { should validate_presence_of(:puzzle_1_solved) }
    it { should validate_presence_of(:puzzle_2_solved) }
    it { should validate_presence_of(:puzzle_3_solved) }
    it { should validate_presence_of(:puzzle_4_solved) }
    it { should validate_presence_of(:puzzle_5_solved) }
  end

  describe "#initialize" do
    it "should initialize with default values" do
      game = Game.create!
      expect(game.puzzle_1_solved).to eq(0)
      expect(game.puzzle_2_solved).to eq(0)
      expect(game.puzzle_3_solved).to eq(0)
      expect(game.puzzle_4_solved).to eq(0)
      expect(game.puzzle_5_solved).to eq(0)
      expect(game.room_name).to be_a(String)
      expect(game.room_name).to_not be_nil
    end
    
    it 'tracks puzzle states' do
      game = Game.create!(puzzle_1_solved: 1, puzzle_2_solved: 0, puzzle_3_solved: 1, puzzle_4_solved: 0, puzzle_5_solved: 0)
      expect(game.puzzle_1_solved).to eq(1)
      expect(game.puzzle_2_solved).to eq(0)
      expect(game.puzzle_3_solved).to eq(1)
      expect(game.puzzle_4_solved).to eq(0)
      expect(game.puzzle_5_solved).to eq(0)
    end
  end

  describe "#end_game" do
    it "should end the game" do
      game = Game.create!(puzzle_1_solved: 1, puzzle_2_solved: 1, puzzle_3_solved: 1, puzzle_4_solved: 1, puzzle_5_solved: 1)
      finish_group_name = game.room_name
      finish_score = 900
      leaderboard = create_list(:leaderboard, 10)

      leaderboard_message = game.end_game(finish_group_name, finish_score)

      find_game = Game.find_by(room_name: finish_group_name)
      expect(find_game).to be_nil

      leaderboard_entry = Leaderboard.find_by(group_name: finish_group_name)
      expect(leaderboard_entry.time_seconds).to eq(finish_score)
    end
  end
end