require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'POST #create' do
    it 'creates a new Game instance and returns a link' do
      post :create
      expect(response).to have_http_status(:ok)

      response_data = JSON.parse(response.body)
      expect(response_data).to include('game_token', 'game_link')

      expect(response_data['game_token']).to be_a(String)
      expect(response_data['game_token']).not_to be_empty
      expect(response_data['game_link']).to be_a(String)
      expect(response_data['game_link']).not_to be_empty
    end
  end
end
