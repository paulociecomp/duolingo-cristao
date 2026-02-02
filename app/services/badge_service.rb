class BadgeService
  def initialize(user)
    @user = user
  end

  def check_all_badges
    check_streak_badges
    check_xp_badges
    check_lesson_badges
    check_perfect_badges
    check_level_badges
  end

  def check_streak_badges
    award_badges_for("streak", @user.current_streak)
  end

  def check_xp_badges
    award_badges_for("xp", @user.total_xp)
  end

  def check_lesson_badges
    completed_count = @user.user_lesson_attempts.completed.count
    award_badges_for("lessons", completed_count)
  end

  def check_perfect_badges
    perfect_count = @user.user_lesson_attempts.perfect.count
    award_badges_for("perfect", perfect_count)
  end

  def check_level_badges
    award_badges_for("level", @user.current_level)
  end

  def award_badge(badge)
    return if badge.earned_by?(@user)

    UserBadge.create!(user: @user, badge: badge)
    @user.increment!(:total_xp, badge.xp_reward) if badge.xp_reward.positive?

    badge
  end

  def recent_badges(limit = 5)
    @user.user_badges.recent.limit(limit).includes(:badge).map(&:badge)
  end

  private

  def award_badges_for(requirement_type, current_value)
    eligible_badges = Badge.where(requirement_type: requirement_type)
                           .where("requirement_value <= ?", current_value)

    eligible_badges.find_each do |badge|
      award_badge(badge)
    end
  end
end
