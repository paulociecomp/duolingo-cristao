FactoryBot.define do
  factory :unit do
    association :track
    sequence(:name) { |n| "Unit #{n}" }
    description { 'A test unit' }
    position { 0 }
    icon { '📚' }

    trait :with_lessons do
      after(:create) do |unit|
        create_list(:lesson, 3, unit: unit)
      end
    end
  end
end
