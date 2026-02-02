class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.references :lesson, null: false, foreign_key: true
      t.integer :exercise_type, null: false
      t.jsonb :content, default: {}, null: false
      t.jsonb :correct_answer, default: {}, null: false
      t.text :explanation
      t.integer :position, default: 0, null: false
      t.integer :xp_value, default: 10, null: false

      t.timestamps
    end

    add_index :exercises, [:lesson_id, :position]
    add_index :exercises, :exercise_type
  end
end
