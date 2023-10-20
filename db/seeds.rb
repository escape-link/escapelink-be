# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
room = Room.create!(room_name: "Where's Bob?", number_puzzles: 5)
Puzzle.create!(room_id: room.id, puzzle_identifier: 1)
Puzzle.create!(room_id: room.id, puzzle_identifier: 2)
Puzzle.create!(room_id: room.id, puzzle_identifier: 3)
Puzzle.create!(room_id: room.id, puzzle_identifier: 4)
Puzzle.create!(room_id: room.id, puzzle_identifier: 5)