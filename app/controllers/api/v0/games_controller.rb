module Api
  module V0
    class GamesController < ApplicationController
      before_action :set_game, only: %i[show update destroy]

      # GET /games
      def index
        @games = Game.all
        render json: @games
      end

      # GET /games/1
      def show
        render json: @game
      end

      # POST /games
      def create
        room_id = params[:room_id]
        room = Room.find_by(id: room_id)

        if room
          # Generate a unique game name
          game_name = Faker::Games::Pokemon.name

          # Create a new game
          @game = Game.new(game_name:, room_id:)
          if @game.save
            render json: { status: 'success', game_id: @game.id, game_name: }, status: :created
          else
            render json: { status: 'error', message: 'Could not create game.' }, status: :unprocessable_entity
          end
        else
          render json: { status: 'error', message: 'Room not found.' }, status: :not_found
        end
      end

      # PATCH/PUT /games/1
      def update
        if @game.update(game_params)
          render json: @game
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      # DELETE /games/1
      def destroy
        @game.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = Game.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def game_params
        params.require(:game).permit(:game_name, :room_id)
      end
    end
  end
end
