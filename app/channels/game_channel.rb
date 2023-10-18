class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{params[:room]}"
  end

  def receive(data)
    ActionCable.server.broadcast("game_#{params[:room]}", data)
  end

  def mark_ready(data)
    game = Game.find_by(room_name: params[:room])
    return unless game

    game.user_ready!(data['nickname'])

    return unless game.all_users_ready?

    ActionCable.server.broadcast("game_#{params[:room]}", { action: 'start_game' })
  end

  def unsubscribed
    # game = Game.find_by(room_name: params[:room])
    # return unless game && game.ready_users.include?(current_user.nickname)

    # game.ready_users.delete(current_user.nickname)
    # game.save
  end
end
