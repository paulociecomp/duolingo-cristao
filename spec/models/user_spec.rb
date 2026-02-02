require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:user_track_progresses).dependent(:destroy) }
    it { should have_many(:user_lesson_attempts).dependent(:destroy) }
    it { should have_many(:user_exercise_attempts).dependent(:destroy) }
    it { should have_many(:user_streaks).dependent(:destroy) }
    it { should have_many(:user_badges).dependent(:destroy) }
    it { should have_many(:badges).through(:user_badges) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:provider) }
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe '#lives_full?' do
    it 'returns true when lives are at max' do
      user = build(:user, lives: 5)
      expect(user.lives_full?).to be true
    end

    it 'returns false when lives are below max' do
      user = build(:user, lives: 3)
      expect(user.lives_full?).to be false
    end
  end

  describe '#can_play?' do
    it 'returns true when user has lives' do
      user = build(:user, lives: 1, premium: false)
      expect(user.can_play?).to be true
    end

    it 'returns true when user is premium' do
      user = build(:user, lives: 0, premium: true)
      expect(user.can_play?).to be true
    end

    it 'returns false when user has no lives and is not premium' do
      user = build(:user, lives: 0, premium: false)
      expect(user.can_play?).to be false
    end
  end

  describe '#xp_for_next_level' do
    it 'calculates XP needed based on level' do
      user = build(:user, current_level: 1)
      expect(user.xp_for_next_level).to eq(100)

      user.current_level = 2
      expect(user.xp_for_next_level).to eq(282)
    end
  end

  describe '.from_omniauth' do
    let(:auth) do
      OmniAuth::AuthHash.new(
        provider: 'google_oauth2',
        uid: '123456',
        info: {
          email: 'test@example.com',
          name: 'Test User',
          image: 'https://example.com/avatar.jpg'
        }
      )
    end

    it 'creates a new user from oauth data' do
      expect { User.from_omniauth(auth) }.to change(User, :count).by(1)
    end

    it 'returns existing user if already exists' do
      User.from_omniauth(auth)
      expect { User.from_omniauth(auth) }.not_to change(User, :count)
    end
  end
end
