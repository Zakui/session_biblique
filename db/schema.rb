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

ActiveRecord::Schema.define(version: 2019_06_25_185957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batiments", force: :cascade do |t|
    t.string "nom"
    t.string "abbreger"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_batiments_on_hash_id"
  end

  create_table "dortoirs", force: :cascade do |t|
    t.string "nom"
    t.string "abbreger"
    t.integer "capacite", default: 0
    t.integer "place_disponible", default: 0
    t.bigint "batiment_id"
    t.string "ocupant"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batiment_id"], name: "index_dortoirs_on_batiment_id"
    t.index ["hash_id"], name: "index_dortoirs_on_hash_id"
  end

  create_table "paroises", force: :cascade do |t|
    t.string "nom"
    t.string "abbreger"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_paroises_on_hash_id"
  end

  create_table "print_fiches", force: :cascade do |t|
    t.string "filtre"
    t.string "opt"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_print_fiches_on_hash_id"
  end

  create_table "print_saves", force: :cascade do |t|
    t.text "ids"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_print_saves_on_hash_id"
  end

  create_table "print_tables", force: :cascade do |t|
    t.string "titre"
    t.text "ids"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_id"], name: "index_print_tables_on_hash_id"
  end

  create_table "sessionistes", force: :cascade do |t|
    t.string "prenoms"
    t.string "nom"
    t.string "sexe"
    t.integer "nombre_participation", default: 0
    t.integer "age"
    t.string "derniere_classe"
    t.string "telephone"
    t.string "classe"
    t.string "groupe"
    t.string "communaute"
    t.bigint "dortoir_id"
    t.bigint "paroise_id"
    t.string "hash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dortoir_id"], name: "index_sessionistes_on_dortoir_id"
    t.index ["hash_id"], name: "index_sessionistes_on_hash_id"
    t.index ["paroise_id"], name: "index_sessionistes_on_paroise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "prenom"
    t.string "nom"
    t.string "fonction"
    t.string "paroise"
    t.integer "telephone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dortoirs", "batiments"
  add_foreign_key "sessionistes", "dortoirs"
  add_foreign_key "sessionistes", "paroises"
end
