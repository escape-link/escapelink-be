class CreateUserRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_rooms do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :hints_used
      t.integer :puzzle_1_solved, default: 0
      t.integer :puzzle_2_solved, default: 0
      t.integer :puzzle_3_solved, default: 0
      t.integer :puzzle_4_solved, default: 0
      t.integer :puzzle_5_solved, default: 0
      t.integer :puzzle_6_solved, default: 0
      t.time :elapsed_time
      t.timestamps
    end
  end
end
