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

ActiveRecord::Schema[7.0].define(version: 2022_10_11_132708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demandes", force: :cascade do |t|
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.string "refustype"
    t.bigint "user_id"
    t.bigint "motif_id"
    t.index ["end_date"], name: "index_demandes_on_end_date"
    t.index ["motif_id"], name: "index_demandes_on_motif_id"
    t.index ["start_date", "end_date"], name: "index_demandes_on_start_date_and_end_date", unique: true
    t.index ["start_date"], name: "index_demandes_on_start_date"
    t.index ["user_id", "motif_id"], name: "index_demandes_on_user_id_and_motif_id", unique: true
    t.index ["user_id"], name: "index_demandes_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "motifs", force: :cascade do |t|
    t.string "reason"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "role", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "demandes", "motifs"
  add_foreign_key "demandes", "users"
end
