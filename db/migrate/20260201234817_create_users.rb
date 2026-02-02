class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.string :avatar_url
      t.integer :total_xp, default: 0, null: false
      t.integer :current_level, default: 1, null: false
      t.integer :lives, default: 5, null: false
      t.datetime :lives_updated_at
      t.integer :current_streak, default: 0, null: false
      t.integer :longest_streak, default: 0, null: false
      t.integer :daily_goal_xp, default: 30, null: false
      t.integer :streak_freeze_count, default: 0, null: false
      t.integer :gems, default: 0, null: false
      t.boolean :premium, default: false, null: false

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true
    add_index :users, :email, unique: true
  end
end
