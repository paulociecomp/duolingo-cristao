class XpService
  EXERCISE_BASE_XP = 10
  LESSON_BONUS_XP = 15
  PERFECT_BONUS_MULTIPLIER = 1.5

  def initialize(user)
    @user = user
  end

  def award_exercise_xp(exercise, correct:)
    return 0 unless correct

    xp = exercise.xp_value
    add_xp(xp)
    xp
  end

  def award_lesson_completion(lesson_attempt)
    base_xp = lesson_attempt.lesson.xp_reward
    bonus = lesson_attempt.perfect? ? (base_xp * PERFECT_BONUS_MULTIPLIER).to_i : base_xp

    add_xp(bonus)
    update_streak_xp(bonus)
    update_league_xp(bonus)
    update_daily_missions(:earn_xp, bonus)

    bonus
  end

  def add_xp(amount)
    return if amount <= 0

    @user.increment!(:total_xp, amount)
    LevelService.new(@user).check_level_up
  end

  private

  def update_streak_xp(amount)
    streak = UserStreak.today_for(@user)
    streak.increment!(:xp_earned, amount)
  end

  def update_league_xp(amount)
    LeagueService.new(@user).add_weekly_xp(amount)
  end

  def update_daily_missions(mission_type, amount)
    MissionService.new(@user).update_progress(mission_type, amount)
  end
end
