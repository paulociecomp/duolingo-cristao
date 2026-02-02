class Track < ApplicationRecord
  has_many :units, -> { order(:position) }, dependent: :destroy
  has_many :lessons, through: :units
  has_many :user_track_progresses, dependent: :destroy

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }
  validates :position, numericality: { greater_than_or_equal_to: 0 }

  scope :published, -> { where(published: true) }
  scope :ordered, -> { order(:position) }

  before_validation :generate_slug, on: :create

  def total_lessons
    lessons.count
  end

  def total_xp
    lessons.sum(:xp_reward)
  end

  private

  def generate_slug
    self.slug ||= name&.parameterize
  end
end
