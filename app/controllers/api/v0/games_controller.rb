class Api::V0::GamesController < ApplicationController
  def create
    game = Game.create!
    ActionCable.server.remote_connections.where(channel: game.room_name).disconnect
    game_link = api_v0_games_path(room_name: game.room_name)

    response = {
      room_name: game.room_name,
      game_link: game_link
    }

    render json: response, status: :created
  end
end
