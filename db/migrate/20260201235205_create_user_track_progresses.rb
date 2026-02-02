class CreateUserTrackProgresses < ActiveRecord::Migration[7.2]
  def change
    create_table :user_track_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.integer :current_unit_id
      t.integer :current_lesson_id
      t.integer :completed_lessons_count, default: 0, null: false
      t.integer :total_xp_earned, default: 0, null: false

      t.timestamps
    end

    add_index :user_track_progresses, [:user_id, :track_id], unique: true
  end
end
