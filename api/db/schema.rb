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

ActiveRecord::Schema[7.0].define(version: 2022_12_11_123124) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.jsonb "settings", null: false
    t.uuid "created_by_id", null: false
    t.uuid "dmed_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_campaigns_on_created_by_id"
    t.index ["dmed_by_id"], name: "index_campaigns_on_dmed_by_id"
  end

  create_table "character_equipaments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "character_id", null: false
    t.uuid "equipament_id", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_equipaments_on_character_id"
    t.index ["equipament_id"], name: "index_character_equipaments_on_equipament_id"
  end

  create_table "character_traits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "traits_id"
    t.uuid "characters_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characters_id"], name: "index_character_traits_on_characters_id"
    t.index ["traits_id"], name: "index_character_traits_on_traits_id"
  end

  create_table "characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.jsonb "stats", null: false
    t.jsonb "personality", null: false
    t.uuid "race_id", null: false
    t.uuid "subrace_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["subrace_id"], name: "index_characters_on_subrace_id"
  end

  create_table "classes_spells", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dnd_class_id", null: false
    t.uuid "spell_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_classes_spells_on_dnd_class_id"
    t.index ["spell_id"], name: "index_classes_spells_on_spell_id"
  end

  create_table "dnd_classes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.json "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dnd_sub_classes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.json "details"
    t.uuid "dnd_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dnd_class_id"], name: "index_dnd_sub_classes_on_dnd_class_id"
  end

  create_table "equipaments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "desc", null: false
    t.uuid "contents_id"
    t.json "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contents_id"], name: "index_equipaments_on_contents_id"
  end

  create_table "feats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.json "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feats_characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "feats_id", null: false
    t.uuid "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feats_id"], name: "index_feats_characters_on_feats_id"
    t.index ["users_id"], name: "index_feats_characters_on_users_id"
  end

  create_table "features", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source_type", default: "Race"
    t.bigint "source_id"
    t.bigint "features_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["features_id"], name: "index_features_sources_on_features_id"
    t.index ["source_type", "source_id"], name: "index_features_sources_on_source"
  end

  create_table "jwt_deny_lists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_deny_lists_on_jti"
  end

  create_table "languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.jsonb "details"
    t.boolean "has_sub_races?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.integer "components"
    t.json "details"
    t.integer "duration_qtd"
    t.integer "duration_type"
    t.boolean "concentration?"
    t.boolean "ritual?"
    t.integer "casting_time_qtd"
    t.integer "casting_time_type"
    t.float "range"
    t.json "size"
    t.integer "format"
    t.boolean "summoning?"
    t.integer "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spoken_languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "language_id"
    t.string "speaker_type"
    t.bigint "speaker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_spoken_languages_on_language_id"
    t.index ["speaker_type", "speaker_id"], name: "index_spoken_languages_on_speaker"
  end

  create_table "sub_races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_sub_races_on_race_id"
  end

  create_table "traits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "source_type", default: "Race"
    t.bigint "source_id"
    t.jsonb "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_traits_on_source"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users", column: "created_by_id"
  add_foreign_key "campaigns", "users", column: "dmed_by_id"
  add_foreign_key "character_equipaments", "characters"
  add_foreign_key "character_equipaments", "equipaments"
  add_foreign_key "characters", "races"
  add_foreign_key "classes_spells", "dnd_classes"
  add_foreign_key "classes_spells", "spells"
  add_foreign_key "dnd_sub_classes", "dnd_classes"
  add_foreign_key "equipaments", "equipaments", column: "contents_id"
  add_foreign_key "feats_characters", "feats", column: "feats_id"
  add_foreign_key "feats_characters", "users", column: "users_id"
  add_foreign_key "sub_races", "races"
end
