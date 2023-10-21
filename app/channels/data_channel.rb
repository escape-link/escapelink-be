class DataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "data_#{params[:game_name]}"
  end

  def receive(data)
    ActionCable.server.broadcast("data_#{params[:game_name]}", data)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
