class ExerciseChecker
  attr_reader :exercise, :user_answer, :correct

  def initialize(exercise, user_answer)
    @exercise = exercise
    @user_answer = user_answer
    @correct = false
  end

  def check!
    @correct = case exercise.exercise_type
               when "multiple_choice", "true_false", "choose_verse"
                 check_single_answer
               when "fill_blank"
                 check_fill_blank
               when "order_words", "sequence_story"
                 check_order
               when "connect_pairs"
                 check_pairs
               when "quick_quiz"
                 check_quiz_answers
               else
                 false
               end

    @correct
  end

  def feedback
    if correct
      { status: :correct, message: correct_message }
    else
      { status: :incorrect, message: incorrect_message, correct_answer: exercise.correct_answer }
    end
  end

  private

  def check_single_answer
    normalize(exercise.correct_answer["value"]) == normalize(user_answer)
  end

  def check_fill_blank
    correct_values = Array(exercise.correct_answer["value"])
    correct_values.any? { |v| normalize(v) == normalize(user_answer) }
  end

  def check_order
    parsed_answer = user_answer.is_a?(String) ? JSON.parse(user_answer) : user_answer
    correct_order = exercise.correct_answer["order"]
    Rails.logger.info "=== ORDER CHECK ==="
    Rails.logger.info "User answer: #{parsed_answer.inspect}"
    Rails.logger.info "Correct order: #{correct_order.inspect}"
    Rails.logger.info "Match: #{correct_order == parsed_answer}"
    correct_order == parsed_answer
  rescue JSON::ParserError
    false
  end

  def check_pairs
    correct_pairs = exercise.correct_answer["pairs"]
    parsed_answer = user_answer.is_a?(String) ? JSON.parse(user_answer) : user_answer
    return false unless parsed_answer.is_a?(Hash) || parsed_answer.is_a?(Array)

    if parsed_answer.is_a?(Array)
      parsed_answer == correct_pairs
    else
      parsed_answer.to_h.stringify_keys == correct_pairs.to_h.stringify_keys
    end
  rescue JSON::ParserError
    false
  end

  def check_quiz_answers
    correct_answers = exercise.correct_answer["answers"]
    parsed_answer = user_answer.is_a?(String) ? JSON.parse(user_answer) : user_answer
    return false unless parsed_answer.is_a?(Array)

    parsed_answer == correct_answers
  rescue JSON::ParserError
    false
  end

  def normalize(value)
    return value unless value.is_a?(String)

    value.to_s.strip.downcase.gsub(/\s+/, " ")
  end

  def correct_message
    messages = [
      "Correto! Deus te abençoe!",
      "Isso mesmo! Continue assim!",
      "Perfeito! Você está no caminho certo!",
      "Excelente! A Palavra está em você!",
      "Maravilha! Glória a Deus!"
    ]
    messages.sample
  end

  def incorrect_message
    if exercise.explanation.present?
      exercise.explanation
    else
      "Não foi dessa vez. Tente novamente!"
    end
  end
end
