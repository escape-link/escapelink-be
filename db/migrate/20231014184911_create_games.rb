class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :puzzle_1_solved, default: 0
      t.integer :puzzle_2_solved, default: 0
      t.integer :puzzle_3_solved, default: 0
      t.integer :puzzle_4_solved, default: 0
      t.integer :puzzle_5_solved, default: 0

      t.timestamps
    end
  end
end
