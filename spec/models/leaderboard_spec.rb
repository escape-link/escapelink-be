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

      expect(team_entry.name).to be_a(String)
      expect(team_entry.name).to eq(name)
      expect(team_entry.score).to eq(time_seconds)
    end
    
    it "SAD PATH:  should not initialize with missing/nil values" do
      # name = "The Husslers"
      time_seconds = 5400
      team_entry = Leaderboard.create!(group_name: name, time_seconds: time_seconds)

      expect(team_entry.name).to_not be_a(String)
      expect(team_entry.name).to_not eq(name)
      expect(team_entry.score).to_not eq(time_seconds)
    end
    
    it "SAD PATH:  should not initialize with missing values" do
      name = "The Husslers"
      # time_seconds = 5400
      team_entry = Leaderboard.create!(group_name: name, time_seconds: time_seconds)

      expect(team_entry.name).to_not be_a(String)
      expect(team_entry.name).to_not eq(name)
      expect(team_entry.score).to_not eq(time_seconds)
    end
  end
end