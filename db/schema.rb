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

ActiveRecord::Schema[7.0].define(version: 2024_07_03_071409) do
  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.text "content", null: false, comment: "コメントの内容"
    t.bigint "prototype_id", null: false, comment: "コメントはプロトタイプに属している"
    t.bigint "user_id", null: false, comment: "コメントはユーザーに属している"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prototype_id"], name: "index_comments_on_prototype_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "prototypes", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false, comment: "プロトタイプのタイトル"
    t.text "catch_copy", null: false, comment: "プロトタイプのキャッチコピー#"
    t.text "concept", null: false, comment: "プロトタイプのコンセプト"
    t.bigint "user_id", null: false, comment: "プロトタイプのuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prototypes_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false, comment: "`ユーザーのメールアドレス"
    t.string "encrypted_password", null: false, comment: "パスワードは暗号化されています"
    t.string "name", null: false, comment: "ユーザーの名前"
    t.text "profile", null: false, comment: "ユーザープロファイル"
    t.text "occupation", null: false, comment: "ユーザーの職業"
    t.text "position", null: false, comment: "ユーザーの役職"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "prototypes"
  add_foreign_key "comments", "users"
  add_foreign_key "prototypes", "users"
end
