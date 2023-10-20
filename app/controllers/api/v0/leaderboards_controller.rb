class Api::V0::LeaderboardsController < ApplicationController
  def index
    @leaderboard = Leaderboard.limit(10)

    leaderboard_link = api_v0_leaderboards_path

    render json: @leaderboard, status: 200
  end
end
