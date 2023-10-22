require 'rails_helper'

RSpec.describe DataChannel, type: :channel do
  before do
    stub_connection current_user: nil
  end

  it 'sends WebSocket message with parameters' do
    room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 1)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 2)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 3)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 4)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 5)
    game = Game.create!(room_id: room.id)
    game_name = game.game_name
    puzzle_identifier = 1
    subscribe(game_name: game_name)

    expect { perform('receive', game_name: game_name, puzzle_identifier: puzzle_identifier) }
    .to have_broadcasted_to("data_#{game_name}").with(a_hash_including('game_name' => game_name, 'puzzle_identifier' => puzzle_identifier))

    expect { perform('receive', game_name: game_name, puzzle_identifier: puzzle_identifier) }
    .to have_broadcasted_to("data_#{game_name}").with(a_hash_including('game_over' => false))
  end

  it 'sends the end game message' do
    room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 1)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 2)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 3)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 4)
    Puzzle.create!(room_id: room.id, puzzle_identifier: 5)
    game = Game.create!(room_id: room.id)
    game_name = game.game_name
    puzzle_identifier = 5
    subscribe(game_name: game_name)
    game_puzzles = game.game_puzzles.all

    game_puzzles[0..3].each do |game_puzzle|
      game_puzzle.update(puzzle_solved: 1)
    end

    expect { perform('receive', game_name: game_name, puzzle_identifier: puzzle_identifier) }
    .to have_broadcasted_to("data_#{game_name}").with(a_hash_including('game_over' => true))
  end
end