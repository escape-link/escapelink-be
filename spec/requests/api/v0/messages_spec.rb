require 'rails_helper'

RSpec.describe Api::V0::MessagesController, type: :controller do
  describe 'POST #create' do
    let(:channel) { create(:channel) }
    let(:valid_attributes) do
      {
        content: 'Hello',
        sender_nickname: 'JohnDoe',
        channel_id: channel.id
      }
    end

    it 'creates a new message' do
      expect do
        post :create, params: { message: valid_attributes }
      end.to change(Message, :count).by(1)
    end

    it 'broadcasts the new message to the correct ActionCable channel' do
      allow(ActionCable.server).to receive(:broadcast)
      post :create, params: { message: valid_attributes }
      expect(ActionCable.server).to have_received(:broadcast).with("game_#{channel.id}", an_instance_of(Message))
    end

    it 'responds with the created message in JSON format' do
      post :create, params: { message: valid_attributes }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['content']).to eq('Hello')
    end
  end
end
