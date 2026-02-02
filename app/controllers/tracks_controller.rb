class TracksController < ApplicationController
  before_action :set_track, only: [:show, :start]

  def index
    @tracks = Track.published.ordered.includes(:units)
    @user_progresses = current_user.user_track_progresses.index_by(&:track_id)
  end

  def show
    @units = @track.units.ordered.includes(lessons: :exercises)
    @progress = current_user.user_track_progresses.find_by(track: @track)
    @completed_lessons = current_user.user_lesson_attempts
                                      .completed
                                      .where(lesson: @track.lessons)
                                      .pluck(:lesson_id)
                                      .to_set
  end

  def start
    progress = UserTrackProgress.find_or_create_by!(user: current_user, track: @track)

    first_unit = @track.units.ordered.first
    first_lesson = first_unit&.lessons&.ordered&.first

    if first_lesson
      progress.update!(current_unit: first_unit, current_lesson: first_lesson)
      redirect_to lesson_path(first_lesson)
    else
      redirect_to track_path(@track), alert: "Esta trilha ainda não tem lições."
    end
  end

  private

  def set_track
    @track = Track.find_by!(slug: params[:id]) || Track.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to tracks_path, alert: "Trilha não encontrada."
  end
end
