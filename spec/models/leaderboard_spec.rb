require "rails_helper"

RSpec.describe Leaderboard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:room_id) }
    it { should validate_presence_of(:game_name) }
    it { should validate_presence_of(:time_seconds) }
  end

  describe "#initialize" do
    it "HAPPY PATH:  should initialize with input values" do
      leaderboard = create_list(:leaderboard, 10)
      room_id = leaderboard.first.room_id
      game = Game.create!(room_id: room_id)
      finish_group_name = game.game_name
      finish_score = 900 #fastest time in seconds

      team_entry = Leaderboard.create!(room_id: room_id, game_name: game.game_name, time_seconds: finish_score)

      expect(team_entry.game_name).to be_a(String)
      expect(team_entry.game_name).to eq(finish_group_name)
      expect(team_entry.time_seconds).to eq(finish_score)
      expect(team_entry.room_id).to eq(room_id)
    end
    
    it "SAD PATH:  should not initialize with missing/nil values" do
      # name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.new(room_id: nil, game_name: nil, time_seconds: time_seconds)

      expect(team_entry).to_not be_valid
      expect(team_entry.errors[:game_name]).to include("can't be blank")
    end
    
    it "SAD PATH:  should not initialize with missing values" do
      name = "The Husslers"
      # time_seconds = 5400
      team_entry = Leaderboard.new(game_name: name)

      expect(team_entry).to_not be_valid
      expect(team_entry.errors[:time_seconds]).to include("can't be blank")
    end
  end

  describe "update leaderboard" do
    it "HAPPY PATH: the new score fits in the top ten" do
      leaderboard = create_list(:leaderboard, 10)
      room_id = leaderboard.first.room_id
      game = Game.create!(room_id: room_id)
      finish_group_name = game.game_name
      finish_score = 900 #fastest time in seconds
      
      message = Leaderboard.update_leaderboard(room_id: room_id, game_name: finish_group_name, time_seconds: finish_score)

      expect(message).to eq("Congratulations! You've claimed a spot on the leaderboard!")
    end

    it "SAD PATH: the new score does not fit into the top ten" do
      leaderboard = create_list(:leaderboard, 10)
      room_id = leaderboard.first.room_id
      game = Game.create!(room_id: room_id)
      finish_group_name = game.game_name
      finish_score = 4000 #slowest time in seconds
      
      message = Leaderboard.update_leaderboard(room_id: room_id, game_name: finish_group_name, time_seconds: finish_score)

      expect(message).to eq("Sorry, you didn't make the leaderboard.")
    end
  end
end