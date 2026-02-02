class User < ApplicationRecord
  MAX_LIVES = 5
  LIFE_REGEN_MINUTES = 30

  has_many :user_track_progresses, dependent: :destroy
  has_many :user_lesson_attempts, dependent: :destroy
  has_many :user_exercise_attempts, dependent: :destroy
  has_many :user_streaks, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :league_participants, dependent: :destroy
  has_many :user_daily_missions, dependent: :destroy
  has_many :spaced_repetition_cards, dependent: :destroy

  validates :provider, :uid, :email, :name, presence: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: { scope: :provider }
  validates :total_xp, :current_level, :lives, :current_streak,
            :longest_streak, :daily_goal_xp, :streak_freeze_count, :gems,
            numericality: { greater_than_or_equal_to: 0 }
  validates :lives, numericality: { less_than_or_equal_to: MAX_LIVES }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  def lives_full?
    lives >= MAX_LIVES
  end

  def can_play?
    premium? || lives.positive?
  end

  def xp_for_next_level
    (100 * (current_level ** 1.5)).to_i
  end

  def xp_progress_percentage
    ((total_xp.to_f / xp_for_next_level) * 100).clamp(0, 100)
  end
end
