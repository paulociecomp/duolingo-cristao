class AchievementsController < ApplicationController
  def index
    @badges_by_category = Badge.all.group_by(&:category)
    @earned_badge_ids = current_user.user_badges.pluck(:badge_id).to_set
    @recent_badges = current_user.user_badges.recent.limit(10).includes(:badge)
  end
end
