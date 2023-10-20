class AddPuzzleIdentifierToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_column :puzzles, :puzzle_identifier, :integer
  end
end
