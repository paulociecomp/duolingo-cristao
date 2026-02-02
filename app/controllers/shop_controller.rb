class ShopController < ApplicationController
  def index
    @life_service = LifeService.new(current_user)
    @streak_service = StreakService.new(current_user)
  end

  def buy_streak_freeze
    if StreakService.new(current_user).buy_streak_freeze!(cost_gems: 10)
      redirect_to shop_index_path, notice: "Streak Freeze comprado! Você tem #{current_user.reload.streak_freeze_count} freeze(s)."
    else
      redirect_to shop_index_path, alert: "Gems insuficientes ou limite atingido."
    end
  end

  def buy_lives
    if LifeService.new(current_user).refill_lives!(cost_gems: 50)
      redirect_to shop_index_path, notice: "Vidas restauradas!"
    else
      redirect_to shop_index_path, alert: "Gems insuficientes ou vidas já estão cheias."
    end
  end
end
