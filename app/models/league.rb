class League < ApplicationRecord
  has_many :league_seasons, dependent: :destroy

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
  validates :tier, presence: true, uniqueness: true,
                   numericality: { greater_than_or_equal_to: 1 }
  validates :min_xp_to_promote, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:tier) }

  TIERS = {
    bronze: 1,
    silver: 2,
    gold: 3,
    platinum: 4,
    diamond: 5,
    master: 6,
    grandmaster: 7
  }.freeze

  def next_league
    League.find_by(tier: tier + 1)
  end

  def previous_league
    League.find_by(tier: tier - 1)
  end

  def current_season
    league_seasons.find_by(active: true)
  end
end
