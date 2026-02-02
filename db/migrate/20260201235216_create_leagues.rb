class CreateLeagues < ActiveRecord::Migration[7.2]
  def change
    create_table :leagues do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :tier, null: false
      t.string :icon, default: "🥉"
      t.string :color, default: "#CD7F32"
      t.integer :min_xp_to_promote, default: 100, null: false

      t.timestamps
    end

    add_index :leagues, :slug, unique: true
    add_index :leagues, :tier, unique: true
  end
end
