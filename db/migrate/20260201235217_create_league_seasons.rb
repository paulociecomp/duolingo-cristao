class CreateLeagueSeasons < ActiveRecord::Migration[7.2]
  def change
    create_table :league_seasons do |t|
      t.references :league, null: false, foreign_key: true
      t.date :week_start, null: false
      t.date :week_end, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :league_seasons, [:league_id, :week_start], unique: true
    add_index :league_seasons, :active
  end
end
