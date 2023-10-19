class Api::V0::GamesController < ApplicationController
  def create
    room_id = params[:room_id]

    unless room_id.present? && room_id.to_i > 0
      render json: { error: 'Invalid room_id' }, status: :unprocessable_entity
      return
    end

    game = Game.create!(room_id:)
    channel_name = "room_#{room_id}"
    ActionCable.server.remote_connections.where(channel: channel_name).disconnect
    game_link = api_v0_games_path(game_name: channel_name)

    response = {
      game_name: game.game_name,
      game_link:
    }

    render json: response, status: :created
  end
end
