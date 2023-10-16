class Leaderboard < ApplicationRecord
  validates :group_name, presence: true
  validates :time_seconds, presence: true
end