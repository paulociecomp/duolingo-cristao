# Script para corrigir o exercício de Gênesis 1:1
exercise = Exercise.joins(:lesson).find_by("exercises.content->>'reference' = ?", "Gênesis 1:1")

if exercise
  exercise.update!(
    content: {
      "words" => ["No", "princípio", "Deus", "criou", "os", "céus", "e", "a", "terra"],
      "reference" => "Gênesis 1:1"
    },
    correct_answer: {
      "order" => ["No", "princípio", "Deus", "criou", "os", "céus", "e", "a", "terra"]
    }
  )
  puts "Exercício atualizado com sucesso!"
  puts "Nova ordem: #{exercise.correct_answer['order'].inspect}"
else
  puts "Exercício não encontrado!"
end
