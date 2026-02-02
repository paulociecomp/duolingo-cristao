class MissionService
  DAILY_MISSION_COUNT = 3

  def initialize(user)
    @user = user
  end

  def today_missions
    ensure_daily_missions!
    @user.user_daily_missions.for_today.includes(:daily_mission)
  end

  def update_progress(mission_type, amount)
    missions = today_missions.joins(:daily_mission)
                             .where(daily_missions: { mission_type: mission_type.to_s })

    missions.each do |user_mission|
      user_mission.increment_progress!(amount)
    end
  end

  def claim_mission!(user_mission)
    return false unless user_mission.user == @user

    user_mission.claim!
  end

  def claim_all_completed!
    today_missions.unclaimed.each(&:claim!)
  end

  def completed_count
    today_missions.completed.count
  end

  def all_completed?
    completed_count == DAILY_MISSION_COUNT
  end

  private

  def ensure_daily_missions!
    return if @user.user_daily_missions.for_today.count >= DAILY_MISSION_COUNT

    available_missions = DailyMission.random_set(DAILY_MISSION_COUNT)

    available_missions.each do |mission|
      UserDailyMission.find_or_create_by!(
        user: @user,
        daily_mission: mission,
        date: Date.current
      )
    end
  end
end
