class SpacedRepetitionCard < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  validates :user_id, uniqueness: { scope: :exercise_id }
  validates :ease_factor, numericality: { greater_than_or_equal_to: 1.3 }
  validates :interval_days, :repetitions,
            numericality: { greater_than_or_equal_to: 0 }

  scope :due, -> { where("next_review_at <= ?", Time.current) }
  scope :for_review, -> { due.order(:next_review_at) }

  MIN_EASE_FACTOR = 1.3
  DEFAULT_EASE_FACTOR = 2.5

  def review!(quality)
    self.repetitions += 1
    self.last_reviewed_at = Time.current

    if quality >= 3
      update_for_correct_answer(quality)
    else
      reset_for_incorrect_answer
    end

    save!
  end

  private

  def update_for_correct_answer(quality)
    if repetitions == 1
      self.interval_days = 1
    elsif repetitions == 2
      self.interval_days = 6
    else
      self.interval_days = (interval_days * ease_factor).round
    end

    self.ease_factor = [
      ease_factor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02)),
      MIN_EASE_FACTOR
    ].max

    self.next_review_at = interval_days.days.from_now
  end

  def reset_for_incorrect_answer
    self.repetitions = 0
    self.interval_days = 1
    self.next_review_at = 1.day.from_now
  end
end
