class LeagueSeason < ApplicationRecord
  belongs_to :league
  has_many :league_participants, dependent: :destroy
  has_many :users, through: :league_participants

  validates :week_start, :week_end, presence: true
  validates :week_start, uniqueness: { scope: :league_id }
  validate :week_end_after_start

  scope :active, -> { where(active: true) }
  scope :current_week, -> { where("week_start <= ? AND week_end >= ?", Date.current, Date.current) }

  def ranked_participants
    league_participants.order(xp_earned: :desc)
  end

  def finalize!
    return if !active?

    transaction do
      assign_ranks!
      process_promotions_and_demotions!
      update!(active: false)
    end
  end

  private

  def week_end_after_start
    return unless week_start && week_end

    errors.add(:week_end, "must be after week start") if week_end <= week_start
  end

  def assign_ranks!
    ranked_participants.each_with_index do |participant, index|
      participant.update!(rank: index + 1)
    end
  end

  def process_promotions_and_demotions!
    participants = ranked_participants.to_a
    top_10 = participants.first(10)
    bottom_10 = participants.last(10)

    top_10.each { |p| p.update!(promoted: true) if league.next_league }
    bottom_10.each { |p| p.update!(demoted: true) if league.previous_league }
  end
end
