class Api::V0::GamesController < ApplicationController
  def create
    game = Game.create!
    ActionCable.server.remote_connections.where(channel: game.room_name).disconnect
    game_link = api_v0_games_path(room_name: game.room_name)

    response = {
      room_name: game.room_name,
      game_link:
    }

    render json: response, status: :created
  end

  def mark_users_ready
    game = Game.find_by(room_name: params[:room_name])
    return render json: { error: 'Game not found' }, status: :not_found unless game

    game.user_ready!(params[:nickname]) # or however you're tracking it

    ActionCable.server.broadcast("game_#{params[:room_name]}", { action: 'start_game' }) if game.all_users_ready?

    render json: { message: 'User marked as ready' }, status: :ok
  end

  def start_game
    Rails.logger.info "Received request to start game: #{data.inspect}"
    game = Game.find_by(room_name: params[:room_name])

    # Validation to make sure the game exists
    return render json: { error: 'Game not found' }, status: :not_found unless game

    game.update!(game_started: true)
    ActionCable.server.broadcast("game_#{params[:room_name]}", { type: 'GAME_STARTED' })

    render json: { message: 'Game Started' }, status: :ok
    Rails.logger.info 'Game started successfully'
  end
end
