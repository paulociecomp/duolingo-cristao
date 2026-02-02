require 'rails_helper'

RSpec.describe LifeService do
  let(:user) { create(:user, lives: 3, premium: false) }
  let(:service) { described_class.new(user) }

  describe '#lose_life!' do
    it 'decrements user lives' do
      expect { service.lose_life! }.to change { user.reload.lives }.from(3).to(2)
    end

    it 'does not decrement below 0' do
      user.update!(lives: 0)
      expect { service.lose_life! }.not_to change { user.reload.lives }
    end

    it 'does not affect premium users' do
      user.update!(premium: true)
      expect { service.lose_life! }.not_to change { user.reload.lives }
    end
  end

  describe '#can_play?' do
    it 'returns true when user has lives' do
      expect(service.can_play?).to be true
    end

    it 'returns false when user has no lives' do
      user.update!(lives: 0)
      expect(service.can_play?).to be false
    end

    it 'returns true for premium users regardless of lives' do
      user.update!(lives: 0, premium: true)
      expect(service.can_play?).to be true
    end
  end

  describe '#regenerate_lives!' do
    before do
      user.update!(lives: 2, lives_updated_at: 35.minutes.ago)
    end

    it 'adds lives based on time passed' do
      expect { service.regenerate_lives! }.to change { user.reload.lives }.from(2).to(3)
    end

    it 'does not exceed max lives' do
      user.update!(lives: 4, lives_updated_at: 2.hours.ago)
      service.regenerate_lives!
      expect(user.reload.lives).to eq(5)
    end
  end

  describe '#refill_lives!' do
    before { user.update!(gems: 100, lives: 2) }

    it 'refills lives and deducts gems' do
      expect(service.refill_lives!(cost_gems: 50)).to be true
      expect(user.reload.lives).to eq(5)
      expect(user.reload.gems).to eq(50)
    end

    it 'returns false when insufficient gems' do
      user.update!(gems: 10)
      expect(service.refill_lives!(cost_gems: 50)).to be false
    end

    it 'returns false when lives are already full' do
      user.update!(lives: 5)
      expect(service.refill_lives!(cost_gems: 50)).to be false
    end
  end
end
