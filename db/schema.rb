# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180901151523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_dependencies", force: :cascade do |t|
    t.bigint "card_id"
    t.string "dependency_type"
    t.bigint "dependency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_dependencies_on_card_id"
    t.index ["dependency_type", "dependency_id"], name: "index_card_dependencies_on_dependency_type_and_dependency_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "event"
    t.boolean "action"
    t.boolean "duration"
    t.boolean "attack"
    t.boolean "reaction"
    t.boolean "treasure"
    t.boolean "reserve"
    t.boolean "traveller"
    t.boolean "victory"
    t.boolean "curse"
    t.boolean "trash"
    t.boolean "prize"
    t.boolean "looter"
    t.boolean "shelter"
    t.boolean "landmark"
    t.boolean "castle"
    t.boolean "gathering"
    t.boolean "hex"
    t.boolean "fate"
    t.boolean "night"
    t.boolean "heirloom"
    t.boolean "doom"
    t.boolean "state"
    t.boolean "spirit"
    t.boolean "boon"
    t.boolean "zombie"
    t.boolean "supply"
    t.integer "cost"
    t.boolean "special_cost"
    t.integer "potion_cost"
  end

  create_table "kingdom_memberships", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "kingdom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_kingdom_memberships_on_card_id"
    t.index ["kingdom_id"], name: "index_kingdom_memberships_on_kingdom_id"
  end

  create_table "kingdoms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.boolean "token"
    t.boolean "mat"
    t.string "image_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "kingdom_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_players"
    t.index ["kingdom_id"], name: "index_plays_on_kingdom_id"
  end

  add_foreign_key "card_dependencies", "cards"
  add_foreign_key "kingdom_memberships", "cards"
  add_foreign_key "kingdom_memberships", "kingdoms"
  add_foreign_key "plays", "kingdoms"
end
