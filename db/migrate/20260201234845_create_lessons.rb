class CreateLessons < ActiveRecord::Migration[7.2]
  def change
    create_table :lessons do |t|
      t.references :unit, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :position, default: 0, null: false
      t.integer :xp_reward, default: 10, null: false

      t.timestamps
    end

    add_index :lessons, [:unit_id, :position]
  end
end
