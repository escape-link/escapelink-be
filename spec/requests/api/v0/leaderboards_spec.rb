require "rails_helper"

RSpec.describe Api::V0::LeaderboardsController, type: :controller do
  describe "GET #index" do
    it "accesses leaderboard data and returns top ten" do
      room_1 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_1 = "The Husslers"
      husslers_time_seconds = 900
      husslers_team_entry = Leaderboard.create!(room_id: room_1.id, game_name: game_name_1, time_seconds: husslers_time_seconds)

      room_2 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_2 = "The Fruitcakes"
      fruitcakes_time_seconds = 1000
      fruitcakes_team_entry = Leaderboard.create!(room_id: room_2.id, game_name: game_name_2, time_seconds: fruitcakes_time_seconds)
      
      room_3 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_3 = "Trout and Wine"
      trout_time_seconds = 1100
      trout_team_entry = Leaderboard.create!(room_id: room_3.id, game_name: game_name_3, time_seconds: trout_time_seconds)
      
      room_4 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_4 = "Silly Goosies"
      silly_time_seconds = 1500
      silly_team_entry = Leaderboard.create!(room_id: room_4.id, game_name: game_name_4, time_seconds: silly_time_seconds)
      
      room_5 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_5 = "Angry Lizards"
      lizards_time_seconds = 1550
      lizards_team_entry = Leaderboard.create!(room_id: room_5.id, game_name: game_name_5, time_seconds: lizards_time_seconds)
      
      room_6 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_6 = "King Dokapon"
      king_time_seconds = 1600
      king_team_entry = Leaderboard.create!(room_id: room_6.id, game_name: game_name_6, time_seconds: king_time_seconds)
      
      room_7 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_7 = "Hell's Bells"
      bells_time_seconds = 1900
      bells_team_entry = Leaderboard.create!(room_id: room_7.id, game_name: game_name_7, time_seconds: bells_time_seconds)
      
      room_8 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_8 = "Lonely Eggbert"
      eggbert_time_seconds = 2000
      eggbert_team_entry = Leaderboard.create!(room_id: room_8.id, game_name: game_name_8, time_seconds: eggbert_time_seconds)
      
      room_9 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_9 = "Disney Adults"
      disney_time_seconds = 2100
      disney_team_entry = Leaderboard.create!(room_id: room_9.id, game_name: game_name_9, time_seconds: disney_time_seconds)
      
      room_10 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_10 = "Thank god this is the last test name I have to come up with"
      done_time_seconds = 3000
      done_team_entry = Leaderboard.create!(room_id: room_10.id, game_name: game_name_10, time_seconds: done_time_seconds)
      
      room_11 = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      game_name_11 = "just kidding I have to make one more to make sure limit works"
      false_alarm_time_seconds = 4000
      false_alarm_team_entry = Leaderboard.create!(room_id: room_11.id, game_name: game_name_11, time_seconds: false_alarm_time_seconds)

      get :index 

      expect(response).to have_http_status(200)

      response_data = JSON.parse(response.body, symbolize_names: true)

      expect(response_data.count).to eq(10)
      expect(response_data.first[:game_name]).to be_a(String)
      expect(response_data.first[:game_name]).to eq(game_name_1)
      expect(response_data.first[:time_seconds]).to be_an(Integer)
      expect(response_data.first[:time_seconds]).to eq(husslers_time_seconds)
      expect(response_data.first[:room_id]).to be_an(Integer)
      expect(response_data.first[:room_id]).to eq(room_1.id)
      expect(response_data.first[:room_id]).to_not eq(room_2.id)
    end
  end
end