class DailyMission < ApplicationRecord
  has_many :user_daily_missions, dependent: :destroy

  MISSION_TYPES = %w[
    earn_xp
    complete_lessons
    perfect_lessons
    maintain_streak
    earn_gems
  ].freeze

  validates :name, :mission_type, presence: true
  validates :mission_type, inclusion: { in: MISSION_TYPES }
  validates :target_value, :xp_reward, :gem_reward,
            numericality: { greater_than_or_equal_to: 0 }

  scope :random_set, ->(count = 3) { order("RANDOM()").limit(count) }
end
