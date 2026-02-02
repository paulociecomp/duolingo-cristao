FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:uid) { |n| "uid_#{n}" }
    provider { 'google_oauth2' }
    name { 'Test User' }
    avatar_url { 'https://example.com/avatar.jpg' }
    total_xp { 0 }
    current_level { 1 }
    lives { 5 }
    current_streak { 0 }
    longest_streak { 0 }
    daily_goal_xp { 30 }
    streak_freeze_count { 0 }
    gems { 100 }
    premium { false }

    trait :premium do
      premium { true }
    end

    trait :no_lives do
      lives { 0 }
    end

    trait :with_xp do
      total_xp { 500 }
      current_level { 3 }
    end

    trait :with_streak do
      current_streak { 7 }
      longest_streak { 7 }
    end
  end
end
