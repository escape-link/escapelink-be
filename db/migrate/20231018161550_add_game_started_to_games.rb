class AddGameStartedToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :game_started, :boolean, default: false
  end
end
