class SpacedRepetitionService
  def initialize(user)
    @user = user
  end

  def cards_due
    @user.spaced_repetition_cards.for_review.includes(:exercise)
  end

  def cards_due_count
    cards_due.count
  end

  def next_card
    cards_due.first
  end

  def add_card(exercise)
    SpacedRepetitionCard.find_or_create_by!(user: @user, exercise: exercise) do |card|
      card.next_review_at = Time.current
    end
  end

  def review_card!(card, quality)
    return unless card.user == @user

    card.review!(quality)
    track_review_stats(card, quality)

    card
  end

  def add_from_lesson(lesson)
    lesson.exercises.each do |exercise|
      add_card(exercise)
    end
  end

  def stats
    cards = @user.spaced_repetition_cards

    {
      total_cards: cards.count,
      due_today: cards_due_count,
      mastered: cards.where("interval_days >= ?", 21).count,
      learning: cards.where("interval_days < ?", 21).count
    }
  end

  private

  def track_review_stats(card, quality)
    MissionService.new(@user).update_progress(:complete_reviews, 1) if quality >= 3
  end
end
