class Game < ApplicationRecord
  before_validation :generate_room_name

  validates :puzzle_1_solved, :puzzle_2_solved, :puzzle_3_solved, :puzzle_4_solved, :puzzle_5_solved, :room_name,
            presence: true

  def end_game(finish_group_name, finish_score)
    tear_down_game(finish_group_name)
    leaderboard_message = Leaderboard.update_leaderboard(finish_group_name, finish_score)
  end

  def user_ready!(nickname)
    return if ready_users.include?(nickname)

    ready_users << nickname
    save
  end

  def all_users_ready?
    ready_users.size == EXPECTED_NUMBER_OF_USERS  # or however you determine the expected number
  end

  private

  require 'faker'

  def generate_room_name
    a = Faker::Adjective.negative
    b = Faker::Color.color_name
    c = Faker::Games::Pokemon.name
    self.room_name = "#{a}-#{b}-#{c}"
  end

  def tear_down_game(room_name)
    game_to_remove = Game.find_by(room_name:)
    game_to_remove.destroy
  end

  def unique_ready_users
    return unless ready_users.uniq.length != ready_users.length

    errors.add(:ready_users, 'should have unique nicknames.')
  end
end
