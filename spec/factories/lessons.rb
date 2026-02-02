FactoryBot.define do
  factory :lesson do
    association :unit
    sequence(:name) { |n| "Lesson #{n}" }
    description { 'A test lesson' }
    position { 0 }
    xp_reward { 15 }

    trait :with_exercises do
      after(:create) do |lesson|
        create_list(:exercise, 5, lesson: lesson)
      end
    end
  end
end
