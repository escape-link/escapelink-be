class Leaderboard < ApplicationRecord
  validates :group_name, presence: true
  validates :time_seconds, presence: true


  def self.update_leaderboard(new_group_name, new_time_seconds)
    all_entries = Leaderboard.all 
    
    max_time_seconds = all_entries.maximum(:time_seconds)
    if new_time_seconds > max_time_seconds
      message = "Sorry, you didn't make the leaderboard."
    else
      entry_to_remove = all_entries.find_by(time_seconds: max_time_seconds)
      entry_to_remove.destroy
      Leaderboard.create(group_name: new_group_name, time_seconds: new_time_seconds)
      message = "Congratulations! You've claimed a spot on the leaderboard!"
    end
    message 
  end
end