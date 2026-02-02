class UserLessonAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  has_many :user_exercise_attempts, dependent: :destroy

  validates :score, :xp_earned, :mistakes_count,
            numericality: { greater_than_or_equal_to: 0 }

  scope :completed, -> { where(completed: true) }
  scope :perfect, -> { where(perfect: true) }
  scope :recent, -> { order(created_at: :desc) }

  def duration_seconds
    return nil unless started_at && completed_at

    (completed_at - started_at).to_i
  end

  def complete!(xp:, mistakes:)
    update!(
      completed: true,
      completed_at: Time.current,
      xp_earned: xp,
      mistakes_count: mistakes,
      perfect: mistakes.zero?,
      score: calculate_score(mistakes)
    )
  end

  private

  def calculate_score(mistakes)
    total = lesson.exercises.count
    return 100 if total.zero? || mistakes.zero?

    ((total - mistakes).to_f / total * 100).round.clamp(0, 100)
  end
end
