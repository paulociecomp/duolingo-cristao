class LevelService
  def initialize(user)
    @user = user
  end

  def check_level_up
    while should_level_up?
      level_up!
    end
  end

  def xp_for_level(level)
    (100 * (level ** 1.5)).to_i
  end

  def xp_needed_for_next_level
    xp_for_level(@user.current_level) - xp_in_current_level
  end

  def xp_in_current_level
    previous_levels_xp = (1...@user.current_level).sum { |l| xp_for_level(l) }
    @user.total_xp - previous_levels_xp
  end

  def progress_percentage
    needed = xp_for_level(@user.current_level)
    current = xp_in_current_level
    return 100 if needed.zero?

    ((current.to_f / needed) * 100).clamp(0, 100).round
  end

  private

  def should_level_up?
    xp_in_current_level >= xp_for_level(@user.current_level)
  end

  def level_up!
    @user.increment!(:current_level)
    BadgeService.new(@user).check_level_badges
  end
end
