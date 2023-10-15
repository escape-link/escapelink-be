class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :content
      t.string :sender_nickname

      t.timestamps
    end
  end
end
