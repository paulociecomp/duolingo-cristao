class CreateUserDailyMissions < ActiveRecord::Migration[7.2]
  def change
    create_table :user_daily_missions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :daily_mission, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :current_value, default: 0, null: false
      t.boolean :completed, default: false, null: false
      t.boolean :claimed, default: false, null: false

      t.timestamps
    end

    add_index :user_daily_missions, [:user_id, :date]
    add_index :user_daily_missions, [:user_id, :daily_mission_id, :date], unique: true, name: "idx_user_daily_missions_unique"
  end
end
