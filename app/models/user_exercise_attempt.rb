class UserExerciseAttempt < ApplicationRecord
  belongs_to :user
  belongs_to :exercise
  belongs_to :user_lesson_attempt

  validates :time_spent_seconds, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :correct, -> { where(correct: true) }
  scope :incorrect, -> { where(correct: false) }
end
