class CreateBadges < ActiveRecord::Migration[7.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :icon, default: "🏆"
      t.integer :category, default: 0, null: false
      t.string :requirement_type, null: false
      t.integer :requirement_value, default: 1, null: false
      t.integer :xp_reward, default: 0, null: false

      t.timestamps
    end

    add_index :badges, :slug, unique: true
    add_index :badges, :category
  end
end
