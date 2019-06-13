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

ActiveRecord::Schema.define(version: 2019_06_13_070920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batiments", force: :cascade do |t|
    t.string "nom"
    t.string "abbreger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chambres", force: :cascade do |t|
    t.string "nom"
    t.string "abbreger"
    t.integer "capacite", default: 0
    t.integer "place_disponible", default: 0
    t.bigint "batiment_id"
    t.string "ocupant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batiment_id"], name: "index_chambres_on_batiment_id"
  end

  create_table "paroises", force: :cascade do |t|
    t.string "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "chambre_id"
    t.bigint "paroise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chambre_id"], name: "index_sessionistes_on_chambre_id"
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

  add_foreign_key "chambres", "batiments"
  add_foreign_key "sessionistes", "chambres"
  add_foreign_key "sessionistes", "paroises"
end
