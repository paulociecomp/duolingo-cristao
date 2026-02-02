class LessonsController < ApplicationController
  before_action :set_lesson
  before_action :check_can_play, only: [:start]

  def show
    @exercises = @lesson.exercises.ordered
    @attempt = current_attempt
    @completed = @lesson.completed_by?(current_user)
    @best_attempt = @lesson.best_attempt_for(current_user)
  end

  def start
    LifeService.new(current_user).regenerate_lives!

    @attempt = current_user.user_lesson_attempts.create!(
      lesson: @lesson,
      started_at: Time.current
    )

    redirect_to lesson_exercise_path(@lesson, @lesson.exercises.ordered.first)
  end

  def complete
    @attempt = current_attempt
    return redirect_to lesson_path(@lesson), alert: "Nenhuma tentativa ativa." unless @attempt

    mistakes = @attempt.user_exercise_attempts.incorrect.count

    xp_earned = XpService.new(current_user).award_lesson_completion(@attempt)
    @attempt.complete!(xp: xp_earned, mistakes: mistakes)

    StreakService.new(current_user).record_activity!
    MissionService.new(current_user).update_progress(:complete_lessons, 1)

    update_track_progress

    redirect_to lesson_path(@lesson), notice: "Lição completa! +#{xp_earned} XP"
  end

  private

  def set_lesson
    @lesson = Lesson.includes(:unit, :exercises).find(params[:id])
  end

  def current_attempt
    current_user.user_lesson_attempts
                .where(lesson: @lesson, completed: false)
                .order(created_at: :desc)
                .first
  end

  def check_can_play
    life_service = LifeService.new(current_user)
    life_service.regenerate_lives!

    unless life_service.can_play?
      redirect_to lesson_path(@lesson), alert: "Você não tem vidas. Aguarde a regeneração ou compre na loja."
    end
  end

  def update_track_progress
    track = @lesson.track
    progress = UserTrackProgress.find_or_create_by!(user: current_user, track: track)

    completed_count = current_user.user_lesson_attempts
                                   .completed
                                   .where(lesson: track.lessons)
                                   .select(:lesson_id)
                                   .distinct
                                   .count

    next_lesson = find_next_lesson

    progress.update!(
      completed_lessons_count: completed_count,
      total_xp_earned: progress.total_xp_earned + @attempt.xp_earned,
      current_lesson: next_lesson,
      current_unit: next_lesson&.unit
    )
  end

  def find_next_lesson
    current_unit = @lesson.unit
    next_in_unit = current_unit.lessons.ordered.where("position > ?", @lesson.position).first

    return next_in_unit if next_in_unit

    next_unit = current_unit.track.units.ordered.where("position > ?", current_unit.position).first
    next_unit&.lessons&.ordered&.first
  end
end
