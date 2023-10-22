class DataChannel < ApplicationCable::Channel
  def subscribed
    stream_from "data_#{params[:game_name]}"
  end

  def receive(data)
    game_name = params[:game_name]
    puzzle_identifier = data["puzzle_identifier"]
    game = Game.find_by(game_name: game_name)
    puzzle = Puzzle.find_by(puzzle_identifier: puzzle_identifier, room_id: game.room_id)
    room_name = Room.find(game.room_id).room_name
    # require 'pry'; binding.pry
    game_puzzle = GamePuzzle.find_by(puzzle_id: puzzle.id, game_id: game.id)
    game_status = game_puzzle.update_puzzle(room_name: room_name, puzzle_identifier: puzzle_identifier, game_name: game_name)
    ActionCable.server.broadcast("data_#{params[:game_name]}", data)
    ActionCable.server.broadcast("data_#{params[:game_name]}", game_status)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
