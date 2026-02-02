class ReviewsController < ApplicationController
  def index
    @sr_service = SpacedRepetitionService.new(current_user)
    @cards_due = @sr_service.cards_due.limit(20).includes(exercise: :lesson)
    @stats = @sr_service.stats
  end

  def show
    @card = current_user.spaced_repetition_cards.find(params[:id])
    @exercise = @card.exercise
  end

  def answer
    @card = current_user.spaced_repetition_cards.find(params[:id])
    quality = params[:quality].to_i.clamp(0, 5)

    SpacedRepetitionService.new(current_user).review_card!(@card, quality)

    redirect_to reviews_path, notice: "Card revisado!"
  end
end
