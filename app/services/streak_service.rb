class StreakService
  MAX_FREEZE = 2

  def initialize(user)
    @user = user
  end

  def record_activity!
    today = Date.current
    streak = UserStreak.find_or_create_by(user: @user, date: today)

    if practiced_yesterday?
      extend_streak!
    elsif missed_yesterday? && !used_freeze_yesterday?
      if can_use_freeze?
        use_streak_freeze!
      else
        reset_streak!
      end
      extend_streak!
    else
      extend_streak!
    end

    check_streak_badges
    update_daily_missions

    streak
  end

  def practiced_yesterday?
    UserStreak.exists?(user: @user, date: Date.yesterday)
  end

  def practiced_today?
    UserStreak.exists?(user: @user, date: Date.current)
  end

  def can_use_freeze?
    @user.streak_freeze_count.positive?
  end

  def buy_streak_freeze!(cost_gems: 10)
    return false if @user.gems < cost_gems
    return false if @user.streak_freeze_count >= MAX_FREEZE

    @user.update!(
      gems: @user.gems - cost_gems,
      streak_freeze_count: @user.streak_freeze_count + 1
    )
    true
  end

  private

  def missed_yesterday?
    !practiced_yesterday? && @user.current_streak.positive?
  end

  def used_freeze_yesterday?
    false
  end

  def extend_streak!
    new_streak = @user.current_streak + 1
    @user.update!(
      current_streak: new_streak,
      longest_streak: [new_streak, @user.longest_streak].max
    )
  end

  def reset_streak!
    @user.update!(current_streak: 0)
  end

  def use_streak_freeze!
    @user.decrement!(:streak_freeze_count)
  end

  def check_streak_badges
    BadgeService.new(@user).check_streak_badges
  end

  def update_daily_missions
    MissionService.new(@user).update_progress(:maintain_streak, 1)
  end
end
