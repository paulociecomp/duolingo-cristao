class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  enum :category, {
    streak: 0,
    xp: 1,
    lessons: 2,
    perfect: 3,
    league: 4,
    special: 5
  }

  validates :name, :slug, :requirement_type, presence: true
  validates :slug, uniqueness: true
  validates :requirement_value, :xp_reward,
            numericality: { greater_than_or_equal_to: 0 }

  scope :by_category, ->(cat) { where(category: cat) }

  def earned_by?(user)
    user_badges.exists?(user: user)
  end
end
