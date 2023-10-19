class AddForeignKeyToLeaderboards < ActiveRecord::Migration[7.0]
  def change
    add_reference :leaderboards, :room, foreign_key: true
  end
end
