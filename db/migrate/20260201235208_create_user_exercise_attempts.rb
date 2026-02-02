class CreateUserExerciseAttempts < ActiveRecord::Migration[7.2]
  def change
    create_table :user_exercise_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.references :user_lesson_attempt, null: false, foreign_key: true
      t.jsonb :user_answer, default: {}
      t.boolean :correct, default: false, null: false
      t.integer :time_spent_seconds, default: 0

      t.timestamps
    end

    add_index :user_exercise_attempts, [:user_lesson_attempt_id, :exercise_id]
  end
end
