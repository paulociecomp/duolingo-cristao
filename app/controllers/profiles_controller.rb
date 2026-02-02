class ProfilesController < ApplicationController
  def show
    @level_service = LevelService.new(current_user)
    @streak_service = StreakService.new(current_user)
    @badge_service = BadgeService.new(current_user)
    @league_service = LeagueService.new(current_user)

    @recent_badges = @badge_service.recent_badges(5)
    @track_progresses = current_user.user_track_progresses.includes(:track)
    @stats = calculate_stats
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: "Perfil atualizado!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :daily_goal_xp)
  end

  def calculate_stats
    {
      total_lessons: current_user.user_lesson_attempts.completed.select(:lesson_id).distinct.count,
      perfect_lessons: current_user.user_lesson_attempts.perfect.count,
      total_exercises: current_user.user_exercise_attempts.correct.count,
      study_days: current_user.user_streaks.count
    }
  end
end
