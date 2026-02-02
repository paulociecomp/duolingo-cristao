class LeaderboardController < ApplicationController
  def index
    @league_service = LeagueService.new(current_user)
    @current_league = @league_service.user_league
    @participants = @league_service.leaderboard(30)
    @current_rank = @league_service.current_rank
    @current_participation = @league_service.current_participation
  end
end
