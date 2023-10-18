class CreateLeaderboard < ActiveRecord::Migration[7.0]
  def change
    create_table :leaderboards do |t|
      t.string :game_name
      t.integer :time_seconds

      t.timestamps
    end
  end
end
