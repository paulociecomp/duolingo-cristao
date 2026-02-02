class LeagueParticipant < ApplicationRecord
  belongs_to :league_season
  belongs_to :user

  validates :user_id, uniqueness: { scope: :league_season_id }
  validates :xp_earned, numericality: { greater_than_or_equal_to: 0 }

  scope :ranked, -> { order(xp_earned: :desc) }
  scope :top, ->(n) { ranked.limit(n) }

  def add_xp!(amount)
    increment!(:xp_earned, amount)
  end
end
