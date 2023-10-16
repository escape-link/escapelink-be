require "rails_helper"

RSpec.describe Leaderboard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:group_name) }
    it { should validate_presence_of(:time_seconds) }
  end

  describe "#initialize" do
    it "HAPPY PATH:  should initialize with input values" do
      name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.create!(group_name: name, time_seconds: time_seconds)

      expect(team_entry.group_name).to be_a(String)
      expect(team_entry.group_name).to eq(name)
      expect(team_entry.time_seconds).to eq(time_seconds)
    end
    
    it "SAD PATH:  should not initialize with missing/nil values" do
      # name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.new(time_seconds: time_seconds)

      expect(team_entry).to_not be_valid
      expect(team_entry.errors[:group_name]).to include("can't be blank")
    end
    
    it "SAD PATH:  should not initialize with missing values" do
      name = "The Husslers"
      # time_seconds = 5400
      team_entry = Leaderboard.new(group_name: name)

      expect(team_entry).to_not be_valid
      expect(team_entry.errors[:time_seconds]).to include("can't be blank")
    end
  end

  describe "update leaderboard" do
    it "HAPPY PATH: the new score fits in the top ten" do
      scores = create_list(:leaderboard, 10)

      new_score = 850
      new_group_name = "Ecstatic-Chartreuse-SonicTheHedgehog"

      message = Leaderboard.update_leaderboard(new_group_name, new_score)

      expect(message).to eq("Congratulations! You've claimed a spot on the leaderboard!")
    end

    it "SAD PATH: the new score does not fit into the top ten" do
      scores = create_list(:leaderboard, 10)

      new_score = 3100
      new_group_name = "Frolicking-ArmyGreen-KnucklesTheEchidna"

      message = Leaderboard.update_leaderboard(new_group_name, new_score)

      expect(message).to eq("Sorry, you didn't make the leaderboard.")
    end
  end
end