class Api::V0::GamesController < ApplicationController
  def create
    game = Game.create!
    game_channel = "game_#{game.game_token}"
    ActionCable.server.remote_connections.where(channel: game_channel).disconnect
    game_link = api_v0_games_path(game_token: game.game_token)

    response = {
      game_token: game.game_token,
      game_link: game_link
    }

    render json: response, status: :created
  end
end
