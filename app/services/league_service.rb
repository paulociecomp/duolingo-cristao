class LeagueService
  PROMOTION_COUNT = 10
  DEMOTION_COUNT = 10

  def initialize(user)
    @user = user
  end

  def current_participation
    current_season&.league_participants&.find_by(user: @user)
  end

  def current_season
    LeagueSeason.active.current_week.joins(:league).order("leagues.tier").first
  end

  def join_league!
    season = current_or_create_season
    return current_participation if current_participation

    LeagueParticipant.create!(
      league_season: season,
      user: @user,
      xp_earned: 0
    )
  end

  def add_weekly_xp(amount)
    participation = current_participation || join_league!
    participation&.add_xp!(amount)
  end

  def current_rank
    participation = current_participation
    return nil unless participation

    current_season
      .league_participants
      .where("xp_earned > ?", participation.xp_earned)
      .count + 1
  end

  def leaderboard(limit = 30)
    current_season&.ranked_participants&.limit(limit)&.includes(:user) || []
  end

  def user_league
    participation = current_participation
    return starting_league unless participation

    participation.league_season.league
  end

  private

  def current_or_create_season
    season = current_season
    return season if season

    league = starting_league
    create_weekly_season(league)
  end

  def starting_league
    League.find_by(tier: 1) || League.ordered.first
  end

  def create_weekly_season(league)
    today = Date.current
    week_start = today.beginning_of_week
    week_end = today.end_of_week

    LeagueSeason.find_or_create_by!(
      league: league,
      week_start: week_start
    ) do |season|
      season.week_end = week_end
      season.active = true
    end
  end
end
