class Api::V0::GamesController < ApplicationController
  def create
    room = Room.find_by(room_name: game_params["room_name"])
    game = Game.create!(room_id: room.id)
    ActionCable.server.remote_connections.where(channel: game.game_name).disconnect
    game_link = api_v0_games_path(game_name: game.game_name)

    response = {
      game_name: game.game_name,
      game_link: game_link
    }
    
    render json: response, status: :created
  end

  private

  def game_params
    params.permit("room_name")
  end
end
