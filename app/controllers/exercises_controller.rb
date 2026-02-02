class ExercisesController < ApplicationController
  layout "exercise"

  before_action :set_lesson
  before_action :set_exercise
  before_action :set_attempt

  def show
    @exercises = @lesson.exercises.ordered
    @current_index = @exercises.index(@exercise)
    @progress = ((@current_index + 1).to_f / @exercises.size * 100).round
  end

  def answer
    checker = ExerciseChecker.new(@exercise, answer_params)
    correct = checker.check!

    create_exercise_attempt(correct)

    if !correct && !current_user.premium?
      LifeService.new(current_user).lose_life!
    end

    if correct
      XpService.new(current_user).award_exercise_xp(@exercise, correct: true)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "exercise-feedback",
          partial: "exercises/feedback",
          locals: { feedback: checker.feedback, correct: correct, next_url: next_step_path(correct) }
        )
      end
      format.html { redirect_to next_step_path(correct) }
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_exercise
    @exercise = @lesson.exercises.find(params[:id])
  end

  def set_attempt
    @attempt = current_user.user_lesson_attempts
                           .where(lesson: @lesson, completed: false)
                           .order(created_at: :desc)
                           .first

    redirect_to lesson_path(@lesson), alert: "Inicie a lição primeiro." unless @attempt
  end

  def answer_params
    if params[:answer].is_a?(ActionController::Parameters)
      params[:answer].permit!.to_h
    else
      params[:answer]
    end
  end

  def create_exercise_attempt(correct)
    UserExerciseAttempt.create!(
      user: current_user,
      exercise: @exercise,
      user_lesson_attempt: @attempt,
      user_answer: answer_params,
      correct: correct
    )
  end

  def next_step_path(correct)
    exercises = @lesson.exercises.ordered.to_a
    current_index = exercises.index(@exercise)
    next_exercise = exercises[current_index + 1]

    if next_exercise
      lesson_exercise_path(@lesson, next_exercise)
    else
      complete_lesson_path(@lesson)
    end
  end
end
