require 'rails_helper'

RSpec.describe ExerciseChecker do
  let(:lesson) { create(:lesson) }

  describe '#check!' do
    context 'with multiple choice exercise' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :multiple_choice,
          correct_answer: { 'value' => 'Gabriel' }
        )
      end

      it 'returns true for correct answer' do
        checker = described_class.new(exercise, 'Gabriel')
        expect(checker.check!).to be true
      end

      it 'returns false for incorrect answer' do
        checker = described_class.new(exercise, 'Miguel')
        expect(checker.check!).to be false
      end
    end

    context 'with fill blank exercise' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :fill_blank,
          correct_answer: { 'value' => 'amor' }
        )
      end

      it 'normalizes answers for comparison' do
        checker = described_class.new(exercise, '  AMOR  ')
        expect(checker.check!).to be true
      end
    end

    context 'with true/false exercise' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :true_false,
          correct_answer: { 'value' => 'true' }
        )
      end

      it 'checks boolean answers correctly' do
        true_checker = described_class.new(exercise, 'true')
        false_checker = described_class.new(exercise, 'false')

        expect(true_checker.check!).to be true
        expect(false_checker.check!).to be false
      end
    end

    context 'with order words exercise' do
      let(:exercise) do
        create(:exercise,
          lesson: lesson,
          exercise_type: :order_words,
          correct_answer: { 'order' => ['No', 'princípio'] }
        )
      end

      it 'checks word order correctly' do
        correct_checker = described_class.new(exercise, ['No', 'princípio'])
        incorrect_checker = described_class.new(exercise, ['princípio', 'No'])

        expect(correct_checker.check!).to be true
        expect(incorrect_checker.check!).to be false
      end
    end
  end

  describe '#feedback' do
    let(:exercise) do
      create(:exercise,
        lesson: lesson,
        exercise_type: :multiple_choice,
        correct_answer: { 'value' => 'A' },
        explanation: 'Custom explanation'
      )
    end

    it 'returns correct feedback for correct answers' do
      checker = described_class.new(exercise, 'A')
      checker.check!

      feedback = checker.feedback
      expect(feedback[:status]).to eq(:correct)
      expect(feedback[:message]).to be_present
    end

    it 'returns incorrect feedback with explanation' do
      checker = described_class.new(exercise, 'B')
      checker.check!

      feedback = checker.feedback
      expect(feedback[:status]).to eq(:incorrect)
      expect(feedback[:message]).to eq('Custom explanation')
      expect(feedback[:correct_answer]).to be_present
    end
  end
end
