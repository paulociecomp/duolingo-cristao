class CreateUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :units do |t|
      t.references :track, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :position, default: 0, null: false
      t.string :icon, default: "📚"

      t.timestamps
    end

    add_index :units, [:track_id, :position]
  end
end
