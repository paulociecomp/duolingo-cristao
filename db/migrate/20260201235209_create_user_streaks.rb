class CreateUserStreaks < ActiveRecord::Migration[7.2]
  def change
    create_table :user_streaks do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :xp_earned, default: 0, null: false
      t.integer :lessons_completed, default: 0, null: false

      t.timestamps
    end

    add_index :user_streaks, [:user_id, :date], unique: true
  end
end
