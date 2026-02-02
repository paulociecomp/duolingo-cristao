class UserTrackProgress < ApplicationRecord
  belongs_to :user
  belongs_to :track
  belongs_to :current_unit, class_name: "Unit", optional: true
  belongs_to :current_lesson, class_name: "Lesson", optional: true

  validates :user_id, uniqueness: { scope: :track_id }
  validates :completed_lessons_count, :total_xp_earned,
            numericality: { greater_than_or_equal_to: 0 }

  def completion_percentage
    return 0 if track.total_lessons.zero?

    ((completed_lessons_count.to_f / track.total_lessons) * 100).round
  end
end
