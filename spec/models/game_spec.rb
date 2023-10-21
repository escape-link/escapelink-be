require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "validations" do
    it { should validate_presence_of(:room_id) }
  end

  describe "relationships" do
    it { should have_many(:game_puzzles) }
    it { should have_many(:puzzles).through(:game_puzzles) }
  end

  describe "#initialize" do
    it "should initialize with default values" do
      room = Room.create!(room_name: "Room 1", number_puzzles: 5)
      game = Game.create!(room_id: room.id)

      expect(game.game_name).to be_a(String)
      expect(game.game_name).to_not be_nil
      expect(game.room_id).to eq(room.id)
    end
  end

  describe "#end_game" do
    it "should end the game and show successful leaderboard message" do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      leaderboard = create_list(:leaderboard, 10, room_id: room.id)
      game = Game.create!(room_id: room.id)
      game_name = game.game_name
      time_seconds = 900 #fastest time in seconds
      game.update(start_time: DateTime.now - time_seconds.seconds)

      leaderboard_message = game.end_game(room_id: room.id, game_name: game_name)

      find_game = Game.find_by(game_name: game_name)
      expect(find_game).to be_nil #game should be destroyed

      leaderboard_entry = Leaderboard.find_by(game_name: game_name)
      expect(leaderboard_entry.time_seconds).to eq(time_seconds)
      expect(leaderboard_message).to eq("Congratulations! You've claimed a spot on the leaderboard!")
    end

    it "should end the game and show unsuccessful leaderboard message" do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      leaderboard = create_list(:leaderboard, 10, room_id: room.id)
      game = Game.create!(room_id: room.id)
      game_name = game.game_name
      time_seconds = 4000 #slowest time in seconds
      game.update(start_time: DateTime.now - time_seconds.seconds)

      leaderboard_message = game.end_game(room_id: room.id, game_name: game_name)

      find_game = Game.find_by(game_name: game_name)
      expect(find_game).to be_nil #game should be destroyed

      leaderboard_entry = Leaderboard.find_by(game_name: game_name)
      expect(leaderboard_entry).to be_nil
      expect(leaderboard_message).to eq("Sorry, you didn't make the leaderboard.")
    end
  end

  describe "#stop_timer" do
    it "can stop a timer and calculate total time seconds" do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game = Game.create!(room_id: room.id)
      game_name = game.game_name
      time_seconds = 910 #slowest time in seconds
      game.update(start_time: DateTime.now - time_seconds.seconds)

      time_seconds = game.stop_timer(game_name: game_name)

      expect(time_seconds).to be_an Float
      expect(time_seconds.round).to eq(910)
    end
  end
end