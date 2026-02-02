class CreateSpacedRepetitionCards < ActiveRecord::Migration[7.2]
  def change
    create_table :spaced_repetition_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.decimal :ease_factor, precision: 4, scale: 2, default: 2.5, null: false
      t.integer :interval_days, default: 1, null: false
      t.integer :repetitions, default: 0, null: false
      t.datetime :next_review_at
      t.datetime :last_reviewed_at

      t.timestamps
    end

    add_index :spaced_repetition_cards, [:user_id, :exercise_id], unique: true
    add_index :spaced_repetition_cards, [:user_id, :next_review_at]
  end
end
