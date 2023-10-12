class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :name
      t.time :fastest_time
      t.text :fastest_time_nickname
      t.integer :allowed_hints
      t.text :puzzle_1_hint
      t.text :puzzle_2_hint
      t.text :puzzle_3_hint
      t.text :puzzle_4_hint
      t.text :puzzle_5_hint
      t.text :puzzle_6_hint
      t.timestamps
    end
  end
end
