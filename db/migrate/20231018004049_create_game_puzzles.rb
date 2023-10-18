class CreateGamePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :game_puzzles do |t|
      t.integer :puzzle_solved, default: 0
      t.references :game, null: false, foreign_key: true
      t.references :puzzle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
