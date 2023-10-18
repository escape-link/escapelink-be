class RemovePuzzle1SolvedFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :puzzle_1_solved, :integer
    remove_column :games, :puzzle_2_solved, :integer
    remove_column :games, :puzzle_3_solved, :integer
    remove_column :games, :puzzle_4_solved, :integer
    remove_column :games, :puzzle_5_solved, :integer
  end
end
