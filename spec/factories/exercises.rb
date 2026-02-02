FactoryBot.define do
  factory :exercise do
    association :lesson
    exercise_type { :multiple_choice }
    content do
      {
        question: 'What is the answer?',
        options: ['A', 'B', 'C', 'D']
      }
    end
    correct_answer { { value: 'A' } }
    explanation { 'The correct answer is A' }
    position { 0 }
    xp_value { 10 }

    trait :fill_blank do
      exercise_type { :fill_blank }
      content do
        {
          text: 'The ___ is blue',
          word_bank: ['sky', 'sea', 'mountain', 'forest']
        }
      end
      correct_answer { { value: 'sky' } }
    end

    trait :true_false do
      exercise_type { :true_false }
      content do
        { statement: 'The sky is blue' }
      end
      correct_answer { { value: 'true' } }
    end

    trait :order_words do
      exercise_type { :order_words }
      content do
        { words: ['Hello', 'world'] }
      end
      correct_answer { { order: ['Hello', 'world'] } }
    end
  end
end
