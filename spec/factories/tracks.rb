FactoryBot.define do
  factory :track do
    sequence(:name) { |n| "Track #{n}" }
    sequence(:slug) { |n| "track-#{n}" }
    description { 'A test track' }
    icon { '📖' }
    color { '#4F46E5' }
    position { 0 }
    published { true }

    trait :unpublished do
      published { false }
    end

    trait :with_units do
      after(:create) do |track|
        create_list(:unit, 2, track: track)
      end
    end
  end
end
