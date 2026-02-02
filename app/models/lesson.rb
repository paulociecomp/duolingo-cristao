class Lesson < ApplicationRecord
  belongs_to :unit
  has_one :track, through: :unit
  has_many :exercises, -> { order(:position) }, dependent: :destroy
  has_many :user_lesson_attempts, dependent: :destroy

  validates :name, presence: true
  validates :position, :xp_reward, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:position) }

  def total_exercises
    exercises.count
  end

  def completed_by?(user)
    user_lesson_attempts.where(user: user, completed: true).exists?
  end

  def best_attempt_for(user)
    user_lesson_attempts.where(user: user, completed: true).order(score: :desc).first
  end
end
