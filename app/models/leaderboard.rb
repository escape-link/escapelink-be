class Leaderboard < ApplicationRecord
  validates :room_id, presence: true
  validates :game_name, presence: true
  validates :time_seconds, presence: true


  def self.update_leaderboard(room_id:, game_name:, time_seconds:)
    all_entries = Leaderboard.all.where(room_id: room_id)
    
    max_time_seconds = all_entries.maximum(:time_seconds)
    if time_seconds > max_time_seconds
      message = "Sorry, you didn't make the leaderboard."
    else
      entry_to_remove = all_entries.find_by(time_seconds: max_time_seconds)
      entry_to_remove.destroy
      Leaderboard.create(room_id: room_id, game_name: game_name, time_seconds: time_seconds)
      message = "Congratulations! You've claimed a spot on the leaderboard!"
    end
    message 
  end
end