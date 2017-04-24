ActiveRecord::Schema.define(version: 20170424132608) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "submitted", default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "title"
  end

  create_table "items", force: :cascade do |t|
    t.string  "title"
    t.integer "category_id"
    t.integer "inventory"
    t.float   "price"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "item_id"
    t.integer "quantity", default: 1
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
