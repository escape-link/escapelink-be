class Api::V0::LeaderboardsController < ApplicationController
  def index
    leaderboard = Leaderboard.where(room_id: leaderboard_params[:room_id])

    render json: leaderboard, status: 200
  end

  private

  def leaderboard_params
    params.permit(:room_id)
  end
end
