class CreateLeagueParticipants < ActiveRecord::Migration[7.2]
  def change
    create_table :league_participants do |t|
      t.references :league_season, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :xp_earned, default: 0, null: false
      t.integer :rank
      t.boolean :promoted, default: false, null: false
      t.boolean :demoted, default: false, null: false

      t.timestamps
    end

    add_index :league_participants, [:league_season_id, :user_id], unique: true
    add_index :league_participants, [:league_season_id, :xp_earned]
  end
end
