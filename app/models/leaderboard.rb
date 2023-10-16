class Leaderboard < ApplicationRecord
  validates :group_name, presence: true
  validates :time_seconds, presence: true


  def self.update_leaderboard(group_name, time_seconds)
    #check existing leaderboard scores
    #if the new score is less than the other ten, 
    #drop the row with highest time and add in the new
    # leaderboard_scores.each do |leaderboard_score|
      # if time_seconds < leaderboard_score
      # leaderboard_score.last.destroy

  end
end