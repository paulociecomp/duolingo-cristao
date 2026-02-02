class Unit < ApplicationRecord
  belongs_to :track
  has_many :lessons, -> { order(:position) }, dependent: :destroy
  has_many :exercises, through: :lessons

  validates :name, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:position) }

  def total_lessons
    lessons.count
  end

  def total_xp
    lessons.sum(:xp_reward)
  end
end
