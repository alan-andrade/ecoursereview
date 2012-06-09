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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120609145309) do

  create_table "course_reviews", :force => true do |t|
    t.integer  "course_id"
    t.integer  "rating"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "provider"
    t.string   "title"
    t.string   "url"
    t.string   "subject"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "youtube_url"
    t.text     "description"
    t.string   "level"
    t.string   "image_url"
    t.string   "course_code"
    t.integer  "price"
    t.string   "slug"
    t.string   "short_url"
    t.float    "average_rating"
  end

  add_index "courses", ["slug"], :name => "index_courses_on_slug", :unique => true

  create_table "professors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image_url"
    t.text     "bio"
  end

  create_table "rates", :force => true do |t|
    t.integer "score"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rate_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 32
    t.text     "free_text"
    t.string   "rater_name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "ratings", ["rate_id"], :name => "index_ratings_on_rate_id"
  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"

  create_table "relationships", :force => true do |t|
    t.integer  "course_id"
    t.integer  "professor_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "relationships", ["course_id", "professor_id"], :name => "index_relationships_on_course_id_and_professor_id", :unique => true
  add_index "relationships", ["course_id"], :name => "index_relationships_on_course_id"
  add_index "relationships", ["professor_id"], :name => "index_relationships_on_professor_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
