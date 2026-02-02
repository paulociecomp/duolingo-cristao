# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_01_235228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "badges", force: :cascade do |t|
    t.integer "category", default: 0, null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon", default: "🏆"
    t.string "name", null: false
    t.string "requirement_type", null: false
    t.integer "requirement_value", default: 1, null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.integer "xp_reward", default: 0, null: false
    t.index ["category"], name: "index_badges_on_category"
    t.index ["slug"], name: "index_badges_on_slug", unique: true
  end

  create_table "daily_missions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "gem_reward", default: 0, null: false
    t.string "icon", default: "⭐"
    t.string "mission_type", null: false
    t.string "name", null: false
    t.integer "target_value", default: 1, null: false
    t.datetime "updated_at", null: false
    t.integer "xp_reward", default: 10, null: false
    t.index ["mission_type"], name: "index_daily_missions_on_mission_type"
  end

  create_table "exercises", force: :cascade do |t|
    t.jsonb "content", default: {}, null: false
    t.jsonb "correct_answer", default: {}, null: false
    t.datetime "created_at", null: false
    t.integer "exercise_type", null: false
    t.text "explanation"
    t.bigint "lesson_id", null: false
    t.integer "position", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "xp_value", default: 10, null: false
    t.index ["exercise_type"], name: "index_exercises_on_exercise_type"
    t.index ["lesson_id", "position"], name: "index_exercises_on_lesson_id_and_position"
    t.index ["lesson_id"], name: "index_exercises_on_lesson_id"
  end

  create_table "league_participants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "demoted", default: false, null: false
    t.bigint "league_season_id", null: false
    t.boolean "promoted", default: false, null: false
    t.integer "rank"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "xp_earned", default: 0, null: false
    t.index ["league_season_id", "user_id"], name: "index_league_participants_on_league_season_id_and_user_id", unique: true
    t.index ["league_season_id", "xp_earned"], name: "index_league_participants_on_league_season_id_and_xp_earned"
    t.index ["league_season_id"], name: "index_league_participants_on_league_season_id"
    t.index ["user_id"], name: "index_league_participants_on_user_id"
  end

  create_table "league_seasons", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.bigint "league_id", null: false
    t.datetime "updated_at", null: false
    t.date "week_end", null: false
    t.date "week_start", null: false
    t.index ["active"], name: "index_league_seasons_on_active"
    t.index ["league_id", "week_start"], name: "index_league_seasons_on_league_id_and_week_start", unique: true
    t.index ["league_id"], name: "index_league_seasons_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "color", default: "#CD7F32"
    t.datetime "created_at", null: false
    t.string "icon", default: "🥉"
    t.integer "min_xp_to_promote", default: 100, null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "tier", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_leagues_on_slug", unique: true
    t.index ["tier"], name: "index_leagues_on_tier", unique: true
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.bigint "unit_id", null: false
    t.datetime "updated_at", null: false
    t.integer "xp_reward", default: 10, null: false
    t.index ["unit_id", "position"], name: "index_lessons_on_unit_id_and_position"
    t.index ["unit_id"], name: "index_lessons_on_unit_id"
  end

  create_table "spaced_repetition_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.decimal "ease_factor", precision: 4, scale: 2, default: "2.5", null: false
    t.bigint "exercise_id", null: false
    t.integer "interval_days", default: 1, null: false
    t.datetime "last_reviewed_at"
    t.datetime "next_review_at"
    t.integer "repetitions", default: 0, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["exercise_id"], name: "index_spaced_repetition_cards_on_exercise_id"
    t.index ["user_id", "exercise_id"], name: "index_spaced_repetition_cards_on_user_id_and_exercise_id", unique: true
    t.index ["user_id", "next_review_at"], name: "index_spaced_repetition_cards_on_user_id_and_next_review_at"
    t.index ["user_id"], name: "index_spaced_repetition_cards_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "color", default: "#4F46E5"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon", default: "📖"
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.boolean "published", default: false, null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_tracks_on_position"
    t.index ["slug"], name: "index_tracks_on_slug", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon", default: "📚"
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.bigint "track_id", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id", "position"], name: "index_units_on_track_id_and_position"
    t.index ["track_id"], name: "index_units_on_track_id"
  end

  create_table "user_badges", force: :cascade do |t|
    t.bigint "badge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "earned_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["badge_id"], name: "index_user_badges_on_badge_id"
    t.index ["user_id", "badge_id"], name: "index_user_badges_on_user_id_and_badge_id", unique: true
    t.index ["user_id"], name: "index_user_badges_on_user_id"
  end

  create_table "user_daily_missions", force: :cascade do |t|
    t.boolean "claimed", default: false, null: false
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.integer "current_value", default: 0, null: false
    t.bigint "daily_mission_id", null: false
    t.date "date", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["daily_mission_id"], name: "index_user_daily_missions_on_daily_mission_id"
    t.index ["user_id", "daily_mission_id", "date"], name: "idx_user_daily_missions_unique", unique: true
    t.index ["user_id", "date"], name: "index_user_daily_missions_on_user_id_and_date"
    t.index ["user_id"], name: "index_user_daily_missions_on_user_id"
  end

  create_table "user_exercise_attempts", force: :cascade do |t|
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.bigint "exercise_id", null: false
    t.integer "time_spent_seconds", default: 0
    t.datetime "updated_at", null: false
    t.jsonb "user_answer", default: {}
    t.bigint "user_id", null: false
    t.bigint "user_lesson_attempt_id", null: false
    t.index ["exercise_id"], name: "index_user_exercise_attempts_on_exercise_id"
    t.index ["user_id"], name: "index_user_exercise_attempts_on_user_id"
    t.index ["user_lesson_attempt_id", "exercise_id"], name: "idx_on_user_lesson_attempt_id_exercise_id_49e532a9c3"
    t.index ["user_lesson_attempt_id"], name: "index_user_exercise_attempts_on_user_lesson_attempt_id"
  end

  create_table "user_lesson_attempts", force: :cascade do |t|
    t.boolean "completed", default: false, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.bigint "lesson_id", null: false
    t.integer "mistakes_count", default: 0, null: false
    t.boolean "perfect", default: false, null: false
    t.integer "score", default: 0, null: false
    t.datetime "started_at"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "xp_earned", default: 0, null: false
    t.index ["lesson_id"], name: "index_user_lesson_attempts_on_lesson_id"
    t.index ["user_id", "completed"], name: "index_user_lesson_attempts_on_user_id_and_completed"
    t.index ["user_id", "lesson_id"], name: "index_user_lesson_attempts_on_user_id_and_lesson_id"
    t.index ["user_id"], name: "index_user_lesson_attempts_on_user_id"
  end

  create_table "user_streaks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date", null: false
    t.integer "lessons_completed", default: 0, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "xp_earned", default: 0, null: false
    t.index ["user_id", "date"], name: "index_user_streaks_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_user_streaks_on_user_id"
  end

  create_table "user_track_progresses", force: :cascade do |t|
    t.integer "completed_lessons_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.integer "current_lesson_id"
    t.integer "current_unit_id"
    t.integer "total_xp_earned", default: 0, null: false
    t.bigint "track_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["track_id"], name: "index_user_track_progresses_on_track_id"
    t.index ["user_id", "track_id"], name: "index_user_track_progresses_on_user_id_and_track_id", unique: true
    t.index ["user_id"], name: "index_user_track_progresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.integer "current_level", default: 1, null: false
    t.integer "current_streak", default: 0, null: false
    t.integer "daily_goal_xp", default: 30, null: false
    t.string "email", null: false
    t.integer "gems", default: 0, null: false
    t.integer "lives", default: 5, null: false
    t.datetime "lives_updated_at"
    t.integer "longest_streak", default: 0, null: false
    t.string "name", null: false
    t.boolean "premium", default: false, null: false
    t.string "provider", null: false
    t.integer "streak_freeze_count", default: 0, null: false
    t.integer "total_xp", default: 0, null: false
    t.string "uid", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

  add_foreign_key "exercises", "lessons"
  add_foreign_key "league_participants", "league_seasons"
  add_foreign_key "league_participants", "users"
  add_foreign_key "league_seasons", "leagues"
  add_foreign_key "lessons", "units"
  add_foreign_key "spaced_repetition_cards", "exercises"
  add_foreign_key "spaced_repetition_cards", "users"
  add_foreign_key "units", "tracks"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
  add_foreign_key "user_daily_missions", "daily_missions"
  add_foreign_key "user_daily_missions", "users"
  add_foreign_key "user_exercise_attempts", "exercises"
  add_foreign_key "user_exercise_attempts", "user_lesson_attempts"
  add_foreign_key "user_exercise_attempts", "users"
  add_foreign_key "user_lesson_attempts", "lessons"
  add_foreign_key "user_lesson_attempts", "users"
  add_foreign_key "user_streaks", "users"
  add_foreign_key "user_track_progresses", "tracks"
  add_foreign_key "user_track_progresses", "users"
end
