class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("game_#{params[:room]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
