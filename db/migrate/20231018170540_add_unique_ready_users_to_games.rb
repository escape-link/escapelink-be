class AddUniqueReadyUsersToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :unique_ready_users, :text, array: true, default: []
  end
end
