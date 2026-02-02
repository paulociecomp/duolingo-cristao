class UserDailyMission < ApplicationRecord
  belongs_to :user
  belongs_to :daily_mission

  validates :date, presence: true
  validates :daily_mission_id, uniqueness: { scope: [:user_id, :date] }
  validates :current_value, numericality: { greater_than_or_equal_to: 0 }

  scope :for_today, -> { where(date: Date.current) }
  scope :completed, -> { where(completed: true) }
  scope :unclaimed, -> { where(completed: true, claimed: false) }

  def progress_percentage
    return 100 if completed?

    target = daily_mission.target_value
    return 0 if target.zero?

    ((current_value.to_f / target) * 100).clamp(0, 100).round
  end

  def increment_progress!(amount = 1)
    new_value = current_value + amount
    target = daily_mission.target_value

    update!(
      current_value: new_value,
      completed: new_value >= target
    )
  end

  def claim!
    return false unless completed? && !claimed?

    transaction do
      user.increment!(:total_xp, daily_mission.xp_reward)
      user.increment!(:gems, daily_mission.gem_reward)
      update!(claimed: true)
    end

    true
  end
end
