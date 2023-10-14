class AddGameTokenToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :game_token, :string, default: -> { 'gen_random_uuid()' }, unique: true
  end
end
