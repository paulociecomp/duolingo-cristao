class UserStreak < ApplicationRecord
  belongs_to :user

  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :xp_earned, :lessons_completed,
            numericality: { greater_than_or_equal_to: 0 }

  scope :recent, -> { order(date: :desc) }
  scope :for_date, ->(date) { where(date: date) }

  def self.today_for(user)
    find_or_create_by(user: user, date: Date.current)
  end
end
