class CreateDailyMissions < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_missions do |t|
      t.string :name, null: false
      t.text :description
      t.string :mission_type, null: false
      t.integer :target_value, default: 1, null: false
      t.integer :xp_reward, default: 10, null: false
      t.integer :gem_reward, default: 0, null: false
      t.string :icon, default: "⭐"

      t.timestamps
    end

    add_index :daily_missions, :mission_type
  end
end
