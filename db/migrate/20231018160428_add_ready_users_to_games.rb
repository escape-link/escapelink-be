class AddReadyUsersToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :ready_users, :text, array: true, default: []
  end
end
