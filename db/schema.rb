# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151001202955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "page_title",       limit: 255
    t.string   "meta_description", limit: 255
    t.text     "description"
    t.string   "slug",             limit: 255
    t.boolean  "active",                       default: true
    t.string   "decoration_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentication_providers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authentication_providers", ["name"], name: "index_name_on_authentication_providers", using: :btree

  create_table "banips", force: :cascade do |t|
    t.string   "ip",         limit: 255
    t.string   "reason",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip",         limit: 255
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "courier"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "capital",    limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "attica",                 default: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "english_name", limit: 255
  end

  create_table "colors_flowers_assocs", force: :cascade do |t|
    t.integer  "flower_id"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.boolean  "active",     default: true
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.decimal  "discount",               precision: 8, scale: 2, default: 0.0
    t.boolean  "continuous"
    t.boolean  "active",                                         default: false
    t.integer  "product_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coupons", ["product_id"], name: "index_coupons_on_product_id", using: :btree

  create_table "deals", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "deal_title",       limit: 255
    t.string   "deal_description", limit: 255
    t.integer  "sales"
    t.boolean  "active"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "discount",                     default: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "homepage",                     default: false
  end

  create_table "decoration_resources", force: :cascade do |t|
    t.string   "caption",         limit: 255
    t.string   "decoration_type", limit: 255
    t.string   "name",            limit: 255
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload",          limit: 255
  end

  create_table "flowers", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.decimal  "price",                    precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "filter",                                           default: true
    t.string   "english_name", limit: 255
  end

  create_table "flowers_products_assocs", force: :cascade do |t|
    t.integer  "colors_flowers_assoc_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "company_name", limit: 255
    t.string   "vat",          limit: 255
    t.string   "tax_office",   limit: 255
    t.string   "field",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",      limit: 255
    t.string   "postal_code",  limit: 255
  end

  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip",         limit: 255
  end

  create_table "occasion_product_assocs", force: :cascade do |t|
    t.integer  "occasion_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "occasion_product_assocs", ["occasion_id"], name: "index_occasion_product_assocs_on_occasion_id", using: :btree
  add_index "occasion_product_assocs", ["product_id"], name: "index_occasion_product_assocs_on_product_id", using: :btree

  create_table "occasions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "filter",                   default: true
    t.string   "english_name", limit: 255
  end

  add_index "occasions", ["name"], name: "index_occasions_on_name", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.string   "status",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "card"
    t.boolean  "spell_check"
    t.text     "comments"
    t.decimal  "total",                     precision: 8, scale: 2, default: 0.0
    t.integer  "error_code"
    t.string   "error_text",    limit: 255
    t.string   "payment_code",  limit: 255
    t.datetime "completed_at"
    t.string   "uuid",          limit: 255
    t.string   "address_check", limit: 255
    t.string   "receipt",       limit: 255
    t.string   "payment_way",   limit: 255
    t.integer  "invoice_id"
    t.string   "name",          limit: 255
    t.string   "phone",         limit: 255
    t.string   "email",         limit: 255
    t.integer  "cart_id"
    t.integer  "coupon_id"
    t.datetime "delivery_time"
    t.boolean  "coupon_sent",                                       default: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  add_index "orders", ["coupon_id"], name: "index_orders_on_coupon_id", using: :btree
  add_index "orders", ["invoice_id"], name: "index_orders_on_invoice_id", using: :btree
  add_index "orders", ["receiver_id"], name: "index_orders_on_receiver_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "postals", force: :cascade do |t|
    t.string   "postal",     limit: 255
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postals", ["city_id"], name: "index_postals_on_city_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "page_title",       limit: 255
    t.string   "meta_description", limit: 255
    t.string   "slug",             limit: 255
    t.text     "body"
    t.datetime "published"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "blog",                         default: true
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "product_lines", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "quantity"
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_lines", ["cart_id"], name: "index_product_lines_on_cart_id", using: :btree
  add_index "product_lines", ["order_id"], name: "index_product_lines_on_order_id", using: :btree
  add_index "product_lines", ["product_id"], name: "index_product_lines_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description"
    t.decimal  "price",                        precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",             limit: 255
    t.boolean  "active",                                               default: true
    t.boolean  "homepage",                                             default: false
    t.string   "meta_description", limit: 255
    t.string   "page_title",       limit: 255
    t.boolean  "custom",                                               default: false
    t.boolean  "skroutz",                                              default: true
    t.integer  "discount",                                             default: 0
    t.boolean  "is_new",                                               default: false
    t.date     "discount_until"
  end

  create_table "receivers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "zip",        limit: 255
    t.integer  "city_id"
    t.string   "floor",      limit: 255
    t.string   "bell_name",  limit: 255
    t.string   "phone1",     limit: 255
    t.string   "phone2",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "latitude",   limit: 255
    t.string   "longitude",  limit: 255
    t.string   "nomos",      limit: 255
    t.string   "area",       limit: 255
  end

  add_index "receivers", ["city_id"], name: "index_receivers_on_city_id", using: :btree
  add_index "receivers", ["user_id"], name: "index_receivers_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
  end

  add_index "sessions", ["client_id"], name: "index_sessions_on_client_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "valid_key",  limit: 255
    t.boolean  "confirmed",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "upload",          limit: 255
    t.string   "uploadable_type", limit: 255
    t.integer  "uploadable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "authentication_provider_id"
    t.string   "uid",                        limit: 255
    t.string   "token",                      limit: 255
    t.datetime "token_expires_at"
    t.text     "params"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "user_authentications", ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "zip",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   limit: 255, default: "user"
    t.string   "phone",                  limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token",      limit: 255
    t.string   "visitor_token",    limit: 255
    t.string   "ip",               limit: 255
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "user_type",        limit: 255
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "created_at"
    t.boolean  "conversion",                   default: false
  end

  add_index "visits", ["user_id", "user_type"], name: "index_visits_on_user_id_and_user_type", using: :btree
  add_index "visits", ["visit_token"], name: "index_visits_on_visit_token", unique: true, using: :btree

  add_foreign_key "sessions", "clients"
end
