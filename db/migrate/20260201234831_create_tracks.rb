class CreateTracks < ActiveRecord::Migration[7.2]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.string :icon, default: "📖"
      t.string :color, default: "#4F46E5"
      t.integer :position, default: 0, null: false
      t.boolean :published, default: false, null: false

      t.timestamps
    end

    add_index :tracks, :slug, unique: true
    add_index :tracks, :position
  end
end
