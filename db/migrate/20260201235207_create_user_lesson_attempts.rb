class CreateUserLessonAttempts < ActiveRecord::Migration[7.2]
  def change
    create_table :user_lesson_attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :completed_at
      t.boolean :completed, default: false, null: false
      t.integer :score, default: 0, null: false
      t.integer :xp_earned, default: 0, null: false
      t.integer :mistakes_count, default: 0, null: false
      t.boolean :perfect, default: false, null: false

      t.timestamps
    end

    add_index :user_lesson_attempts, [:user_id, :lesson_id]
    add_index :user_lesson_attempts, [:user_id, :completed]
  end
end
