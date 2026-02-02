require 'rails_helper'

RSpec.describe XpService do
  let(:user) { create(:user, total_xp: 0, current_level: 1) }
  let(:service) { described_class.new(user) }

  describe '#award_exercise_xp' do
    let(:exercise) { create(:exercise, xp_value: 10) }

    it 'awards XP for correct answers' do
      expect { service.award_exercise_xp(exercise, correct: true) }
        .to change { user.reload.total_xp }.by(10)
    end

    it 'does not award XP for incorrect answers' do
      expect { service.award_exercise_xp(exercise, correct: false) }
        .not_to change { user.reload.total_xp }
    end

    it 'returns the XP amount for correct answers' do
      expect(service.award_exercise_xp(exercise, correct: true)).to eq(10)
    end

    it 'returns 0 for incorrect answers' do
      expect(service.award_exercise_xp(exercise, correct: false)).to eq(0)
    end
  end

  describe '#add_xp' do
    it 'increments user total XP' do
      expect { service.add_xp(50) }.to change { user.reload.total_xp }.by(50)
    end

    it 'does nothing for non-positive amounts' do
      expect { service.add_xp(0) }.not_to change { user.reload.total_xp }
      expect { service.add_xp(-10) }.not_to change { user.reload.total_xp }
    end
  end
end
