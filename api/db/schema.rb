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

ActiveRecord::Schema[7.0].define(version: 2023_01_17_183259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "armors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "category", null: false
    t.integer "armor_class", null: false
    t.boolean "armor_class_dex_bonus", default: false, null: false
    t.integer "armor_class_max_bonus"
    t.boolean "stealth_disadvantage", null: false
    t.integer "str_minimum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "hit_die", default: 0, null: false
    t.json "details", null: false
    t.integer "saving_throws", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "dnd_sub_classes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.json "details", null: false
    t.uuid "dnd_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
    t.index ["dnd_class_id"], name: "index_dnd_sub_classes_on_dnd_class_id"
  end

  create_table "equipment_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.float "cost_qtd"
    t.integer "cost_unit"
    t.uuid "equipment_category_id", null: false
    t.integer "weight"
    t.integer "default_quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
    t.index ["equipment_category_id"], name: "index_equipments_on_equipment_category_id"
    t.index ["source_type", "source_id"], name: "index_equipments_on_source"
  end

  create_table "feats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.json "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
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
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.json "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "features_sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source_type", default: "Race", null: false
    t.uuid "source_id", null: false
    t.uuid "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_features_sources_on_feature_id"
    t.index ["source_type", "source_id"], name: "index_features_sources_on_source"
  end

  create_table "gears", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gears_equipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "gear_id", null: false
    t.uuid "equipments_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipments_id"], name: "index_gears_equipments_on_equipments_id"
    t.index ["gear_id"], name: "index_gears_equipments_on_gear_id"
  end

  create_table "homebrew_accesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "character_id", null: false
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_homebrew_accesses_on_character_id"
    t.index ["source_type", "source_id"], name: "index_homebrew_accesses_on_source"
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

  create_table "monsters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "details"
    t.float "challenge_rating"
    t.integer "creature_type"
    t.integer "size"
    t.integer "aligment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "proficiencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.uuid "equipment_category_id"
    t.uuid "weapon_category_id"
    t.uuid "armor_category_id"
    t.uuid "tool_category_id"
    t.uuid "skill_id"
    t.uuid "saving_throw_id"
    t.uuid "ability_id"
    t.uuid "language_id"
    t.uuid "vehicle_id"
    t.uuid "weapon_id"
    t.uuid "armor_id"
    t.uuid "tool_id"
    t.uuid "spell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
    t.index ["ability_id"], name: "index_proficiencies_on_ability_id"
    t.index ["armor_category_id"], name: "index_proficiencies_on_armor_category_id"
    t.index ["armor_id"], name: "index_proficiencies_on_armor_id"
    t.index ["equipment_category_id"], name: "index_proficiencies_on_equipment_category_id"
    t.index ["language_id"], name: "index_proficiencies_on_language_id"
    t.index ["saving_throw_id"], name: "index_proficiencies_on_saving_throw_id"
    t.index ["skill_id"], name: "index_proficiencies_on_skill_id"
    t.index ["source_type", "source_id"], name: "index_proficiencies_on_source"
    t.index ["spell_id"], name: "index_proficiencies_on_spell_id"
    t.index ["tool_category_id"], name: "index_proficiencies_on_tool_category_id"
    t.index ["tool_id"], name: "index_proficiencies_on_tool_id"
    t.index ["vehicle_id"], name: "index_proficiencies_on_vehicle_id"
    t.index ["weapon_category_id"], name: "index_proficiencies_on_weapon_category_id"
    t.index ["weapon_id"], name: "index_proficiencies_on_weapon_id"
  end

  create_table "proficiency_choices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "choose", null: false
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.uuid "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_proficiency_choices_on_proficiency_id"
    t.index ["source_type", "source_id"], name: "index_proficiency_choices_on_source"
  end

  create_table "races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.jsonb "details"
    t.boolean "has_sub_races?"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "skill_characters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "skills_id", null: false
    t.uuid "character_id", null: false
    t.integer "proficiency_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_skill_characters_on_character_id"
    t.index ["skills_id"], name: "index_skill_characters_on_skills_id"
  end

  create_table "skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: "", null: false
    t.integer "default_ability_score", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "spells", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "components", default: "", null: false
    t.integer "level", default: 0, null: false
    t.string "material", default: "", null: false
    t.boolean "ritual", default: false, null: false
    t.boolean "concentration", default: false, null: false
    t.integer "duration_qtd", null: false
    t.integer "duration_type", default: 0, null: false
    t.integer "casting_time_qtd", default: 1, null: false
    t.integer "casting_time_type", default: 0, null: false
    t.float "range", default: 0.0, null: false
    t.integer "range_type", default: 0, null: false
    t.integer "area_of_effect_type", default: 0
    t.integer "area_of_effect_size", default: 1
    t.integer "school", default: 0, null: false
    t.json "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
  end

  create_table "spoken_languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "language_id", null: false
    t.string "speaker_type"
    t.bigint "speaker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_spoken_languages_on_language_id"
    t.index ["speaker_type", "speaker_id"], name: "index_spoken_languages_on_speaker"
  end

  create_table "starting_equipment_choices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "choose"
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.uuid "equipments_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipments_id"], name: "index_starting_equipment_choices_on_equipments_id"
    t.index ["source_type", "source_id"], name: "index_starting_equipment_choices_on_source"
  end

  create_table "starting_equipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "source_type", null: false
    t.uuid "source_id", null: false
    t.uuid "equipments_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipments_id"], name: "index_starting_equipments_on_equipments_id"
    t.index ["source_type", "source_id"], name: "index_starting_equipments_on_source"
  end

  create_table "sub_races", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
    t.index ["race_id"], name: "index_sub_races_on_race_id"
  end

  create_table "tools", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "source_type", default: "Race"
    t.bigint "source_id"
    t.jsonb "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "homebrew", default: false, null: false
    t.boolean "public", default: true, null: false
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

  create_table "vehicles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "speed_qtd"
    t.integer "speed_unit"
    t.integer "capacity"
    t.integer "vehicle_category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "actions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_properties_weapons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "weapon_id"
    t.uuid "weapon_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapon_id"], name: "index_weapon_properties_weapons_on_weapon_id"
    t.index ["weapon_property_id"], name: "index_weapon_properties_weapons_on_weapon_property_id"
  end

  create_table "weapons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "melee", null: false
    t.boolean "martial", null: false
    t.integer "damage_type", null: false
    t.string "damage_dice", null: false
    t.integer "range", null: false
    t.integer "range_long"
    t.integer "throw_range"
    t.integer "throw_range_long"
    t.string "two_handed_damage_dice"
    t.integer "two_handed_damage_type"
    t.json "actions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "users", column: "created_by_id"
  add_foreign_key "campaigns", "users", column: "dmed_by_id"
  add_foreign_key "characters", "races"
  add_foreign_key "classes_spells", "dnd_classes"
  add_foreign_key "classes_spells", "spells"
  add_foreign_key "dnd_sub_classes", "dnd_classes"
  add_foreign_key "equipments", "equipment_categories"
  add_foreign_key "feats_characters", "feats", column: "feats_id"
  add_foreign_key "feats_characters", "users", column: "users_id"
  add_foreign_key "features_sources", "features"
  add_foreign_key "gears_equipments", "equipments", column: "equipments_id"
  add_foreign_key "gears_equipments", "gears"
  add_foreign_key "homebrew_accesses", "characters"
  add_foreign_key "proficiency_choices", "proficiencies"
  add_foreign_key "skill_characters", "characters"
  add_foreign_key "skill_characters", "skills", column: "skills_id"
  add_foreign_key "starting_equipment_choices", "equipments", column: "equipments_id"
  add_foreign_key "starting_equipments", "equipments", column: "equipments_id"
  add_foreign_key "sub_races", "races"
  add_foreign_key "weapon_properties_weapons", "weapon_properties"
  add_foreign_key "weapon_properties_weapons", "weapons"
end
