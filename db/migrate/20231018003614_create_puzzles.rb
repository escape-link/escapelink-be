class CreatePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :puzzles do |t|
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
