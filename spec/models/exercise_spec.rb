require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'associations' do
    it { should belong_to(:lesson) }
    it { should have_one(:unit).through(:lesson) }
    it { should have_many(:user_exercise_attempts).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:exercise_type) }
  end

  describe 'enums' do
    it 'defines exercise_type enum' do
      expect(Exercise.exercise_types).to include(
        'multiple_choice' => 0,
        'fill_blank' => 1,
        'order_words' => 2,
        'connect_pairs' => 3,
        'true_false' => 4,
        'quick_quiz' => 5,
        'choose_verse' => 6,
        'sequence_story' => 7
      )
    end
  end

  describe '#check_answer' do
    let(:lesson) { create(:lesson) }

    context 'multiple choice' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :multiple_choice,
          correct_answer: { 'value' => 'Gabriel' }
        )
      end

      it 'returns true for correct answer' do
        expect(exercise.check_answer('Gabriel')).to be true
      end

      it 'returns false for incorrect answer' do
        expect(exercise.check_answer('Miguel')).to be false
      end
    end

    context 'true false' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :true_false,
          correct_answer: { 'value' => 'true' }
        )
      end

      it 'returns true for correct answer' do
        expect(exercise.check_answer('true')).to be true
      end
    end

    context 'fill blank' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :fill_blank,
          correct_answer: { 'value' => 'amor' }
        )
      end

      it 'normalizes and compares answers' do
        expect(exercise.check_answer('  AMOR  ')).to be true
      end
    end

    context 'order words' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :order_words,
          correct_answer: { 'order' => ['No', 'princípio', 'era', 'o', 'Verbo'] }
        )
      end

      it 'returns true for correct order' do
        expect(exercise.check_answer(['No', 'princípio', 'era', 'o', 'Verbo'])).to be true
      end

      it 'returns false for incorrect order' do
        expect(exercise.check_answer(['No', 'era', 'princípio', 'o', 'Verbo'])).to be false
      end
    end
  end
end
