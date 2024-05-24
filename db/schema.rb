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

ActiveRecord::Schema[7.1].define(version: 2024_05_22_120119) do
  create_schema "auth"
  create_schema "cron"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "net"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "pgvector"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_cron"
  enable_extension "pg_net"
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "pgjwt"
  enable_extension "pgsodium"
  enable_extension "plpgsql"
  enable_extension "supabase_vault"
  enable_extension "uuid-ossp"
  enable_extension "vector"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "documents" because of following StandardError
#   Unknown type 'vector(384)' for column 'embedding'

  create_table "quiz", id: :bigint, default: nil, force: :cascade do |t|
    t.timestamptz "created_at", default: -> { "now()" }, null: false
    t.text "question", default: ""
    t.text "answer", default: ""
    t.bigint "count", default: 0, null: false
  end

  create_table "users", primary_key: "user_id", id: :string, force: :cascade do |t|
    t.timestamptz "created_at", default: -> { "now()" }, null: false
    t.text "last_event"
    t.integer "status", limit: 2, default: 0

    t.unique_constraint ["user_id"], name: "users_user_id_key"
  end

end
