require "rails_helper"

RSpec.describe Leaderboard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:game_name) }
    it { should validate_presence_of(:time_seconds) }
  end

  describe "#initialize" do
    it "HAPPY PATH:  should initialize with input values" do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.create!(room_id: room.id, game_name: name, time_seconds: time_seconds)

      expect(team_entry.room_id).to eq(room.id)
      expect(team_entry.game_name).to be_a(String)
      expect(team_entry.game_name).to eq(name)
      expect(team_entry.time_seconds).to eq(time_seconds)
    end
    
    it "SAD PATH:  should not initialize with missing/nil values" do
      # name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.new(time_seconds: time_seconds)

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
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      leaderboard = create_list(:leaderboard, 10, room_id: room.id)
      game_name = "Ecstatic-Chartreuse-SonicTheHedgehog"
      time_seconds = 850

      message = Leaderboard.update_leaderboard(room_id: room.id, game_name: game_name, time_seconds: time_seconds)

      expect(message).to eq("Congratulations! You've claimed a spot on the leaderboard!")
    end

    it "SAD PATH: the new score does not fit into the top ten" do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      leaderboard = create_list(:leaderboard, 10, room_id: room.id)
      game_name = "Frolicking-ArmyGreen-KnucklesTheEchidna"
      time_seconds = 3100

      message = Leaderboard.update_leaderboard(room_id: room.id, game_name: game_name, time_seconds: time_seconds)

      expect(message).to eq("Sorry, you didn't make the leaderboard.")
    end
  end
end