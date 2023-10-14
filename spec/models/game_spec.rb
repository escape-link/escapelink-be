require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "validations" do
    it { should validate_presence_of(:puzzle_1_solved) }
    it { should validate_presence_of(:puzzle_2_solved) }
    it { should validate_presence_of(:puzzle_3_solved) }
    it { should validate_presence_of(:puzzle_4_solved) }
    it { should validate_presence_of(:puzzle_5_solved) }
    it { should validate_presence_of(:game_token) }
  end

  describe "#initialize" do
    it "should initialize with default values" do
      game = Game.create!
      expect(game.puzzle_1_solved).to eq(0)
      expect(game.puzzle_2_solved).to eq(0)
      expect(game.puzzle_3_solved).to eq(0)
      expect(game.puzzle_4_solved).to eq(0)
      expect(game.puzzle_5_solved).to eq(0)
      expect(game.game_token).to be_a(String)
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
end
