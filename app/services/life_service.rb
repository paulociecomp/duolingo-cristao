class LifeService
  MAX_LIVES = User::MAX_LIVES
  REGEN_MINUTES = User::LIFE_REGEN_MINUTES

  def initialize(user)
    @user = user
  end

  def lose_life!
    return if @user.premium?
    return if @user.lives <= 0

    @user.decrement!(:lives)
    @user.update!(lives_updated_at: Time.current) if @user.lives_updated_at.nil?
  end

  def regenerate_lives!
    return if @user.lives_full?
    return if @user.lives_updated_at.nil?

    lives_to_add = calculate_regenerated_lives
    return if lives_to_add.zero?

    new_lives = [@user.lives + lives_to_add, MAX_LIVES].min
    @user.update!(
      lives: new_lives,
      lives_updated_at: new_lives >= MAX_LIVES ? nil : Time.current
    )
  end

  def time_until_next_life
    return 0 if @user.lives_full?
    return REGEN_MINUTES.minutes if @user.lives_updated_at.nil?

    elapsed = Time.current - @user.lives_updated_at
    remaining = REGEN_MINUTES.minutes - (elapsed % REGEN_MINUTES.minutes)
    remaining.to_i
  end

  def can_play?
    @user.premium? || @user.lives.positive?
  end

  def refill_lives!(cost_gems: 50)
    return false if @user.lives_full?

    # Free refill when lives are completely empty
    actual_cost = @user.lives.zero? ? 0 : cost_gems
    return false if @user.gems < actual_cost

    @user.update!(
      gems: @user.gems - actual_cost,
      lives: MAX_LIVES,
      lives_updated_at: nil
    )
    true
  end

  private

  def calculate_regenerated_lives
    return 0 if @user.lives_updated_at.nil?

    elapsed_minutes = ((Time.current - @user.lives_updated_at) / 60).to_i
    elapsed_minutes / REGEN_MINUTES
  end
end
