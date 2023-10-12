class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.text :room_name
      t.time :fastest_time
      t.text :fastest_time_nickname
      t.text :puzzle_1_hint_1
      t.text :puzzle_1_hint_2
      t.text :puzzle_1_hint_3
      t.text :puzzle_2_hint_1
      t.text :puzzle_2_hint_2
      t.text :puzzle_2_hint_3
      t.text :puzzle_3_hint_1
      t.text :puzzle_3_hint_2
      t.text :puzzle_3_hint_3
      t.text :puzzle_4_hint_1
      t.text :puzzle_4_hint_2
      t.text :puzzle_4_hint_3
      t.text :puzzle_5_hint_1
      t.text :puzzle_5_hint_2
      t.text :puzzle_5_hint_3
      t.text :puzzle_6_hint_1
      t.text :puzzle_6_hint_2
      t.text :puzzle_6_hint_3
      t.timestamps
    end
  end
end
