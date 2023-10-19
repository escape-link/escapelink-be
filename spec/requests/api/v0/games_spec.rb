require 'rails_helper'

RSpec.describe Api::V0::GamesController, type: :controller do
  describe 'POST #create' do
    it 'creates a new Game instance and returns a link' do
      room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
      post :create, params: { room_name: room.room_name }

      expect(response).to have_http_status(:created)

      response_data = JSON.parse(response.body)
      expect(response_data).to include('room_name', 'game_link')

      expect(response_data['room_name']).to be_a(String)
      expect(response_data['room_name']).not_to be_empty
      expect(response_data['game_link']).to be_a(String)
      expect(response_data['game_link']).not_to be_empty
    end
  end
end
