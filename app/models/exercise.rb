class Exercise < ApplicationRecord
  belongs_to :lesson
  has_one :unit, through: :lesson
  has_one :track, through: :unit
  has_many :user_exercise_attempts, dependent: :destroy

  enum :exercise_type, {
    multiple_choice: 0,
    fill_blank: 1,
    order_words: 2,
    connect_pairs: 3,
    true_false: 4,
    quick_quiz: 5,
    choose_verse: 6,
    sequence_story: 7
  }

  validates :exercise_type, presence: true
  validates :position, :xp_value, numericality: { greater_than_or_equal_to: 0 }
  validate :content_structure

  scope :ordered, -> { order(:position) }

  def check_answer(user_answer)
    case exercise_type
    when "multiple_choice", "true_false", "choose_verse"
      correct_answer["value"] == user_answer
    when "fill_blank"
      normalize_answer(correct_answer["value"]) == normalize_answer(user_answer)
    when "order_words", "sequence_story"
      correct_answer["order"] == user_answer
    when "connect_pairs"
      correct_answer["pairs"] == user_answer
    when "quick_quiz"
      correct_answer["answers"] == user_answer
    else
      false
    end
  end

  private

  def normalize_answer(answer)
    answer.to_s.strip.downcase.gsub(/\s+/, " ")
  end

  def content_structure
    return if content.is_a?(Hash)

    errors.add(:content, "must be a valid JSON object")
  end
end
