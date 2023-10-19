class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room]}_#{params[:game_name]}"
  end

  def receive(data)
    case data['type']
    when 'chat'
      ActionCable.server.broadcast("game_#{params[:room]}_#{params[:game_name]}", data)
    else
      Rails.logger.warn("Received unrecognized command: #{data.inspect}")
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
