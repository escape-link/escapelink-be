class UpdateGamesWithNewStructure < ActiveRecord::Migration[7.0]
  def change
    change_table :games do |t|
      t.rename :room_name, :game_name
      t.references :room, foreign_key: true
    end
  end
end
