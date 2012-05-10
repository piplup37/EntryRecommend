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

ActiveRecord::Schema.define(:version => 20120510092909) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categs", :force => true do |t|
    t.string   "categ_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categs_subjects", :id => false, :force => true do |t|
    t.integer "categ_id"
    t.integer "subject_id"
  end

  add_index "categs_subjects", ["categ_id"], :name => "index_categs_subjects_on_categ_id"
  add_index "categs_subjects", ["subject_id"], :name => "index_categs_subjects_on_subject_id"

  create_table "curriculums", :force => true do |t|
    t.integer  "user_id"
    t.integer  "lank"
    t.text     "explain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "curriculums", ["user_id"], :name => "index_curriculums_on_user_id"

  create_table "curriculums_subjects", :force => true do |t|
    t.integer  "curriculum_id"
    t.integer  "subject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "curriculums_subjects", ["curriculum_id"], :name => "index_curriculums_subjects_on_curriculum_id"
  add_index "curriculums_subjects", ["subject_id"], :name => "index_curriculums_subjects_on_subject_id"

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "entries", ["subject_id"], :name => "index_entries_on_subject_id"
  add_index "entries", ["user_id"], :name => "index_entries_on_user_id"

  create_table "friend_requests", :force => true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.text     "message"
    t.boolean  "check"
    t.boolean  "approval"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "friend_requests", ["from_user_id"], :name => "index_friend_requests_on_from_user_id"
  add_index "friend_requests", ["to_user_id"], :name => "index_friend_requests_on_to_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "r_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "tensu"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scores", ["subject_id"], :name => "index_scores_on_subject_id"
  add_index "scores", ["user_id"], :name => "index_scores_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "subjects", :force => true do |t|
    t.string   "sub_name"
    t.integer  "credit"
    t.integer  "year"
    t.string   "part"
    t.string   "period"
    t.string   "kubun"
    t.string   "ip_comp"
    t.string   "cs_comp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects_teachers", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subjects_teachers", ["subject_id"], :name => "index_subjects_teachers_on_subject_id"
  add_index "subjects_teachers", ["teacher_id"], :name => "index_subjects_teachers_on_teacher_id"

  create_table "teachers", :force => true do |t|
    t.string   "t_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "no"
    t.string   "user_name"
    t.string   "cource"
    t.integer  "lank"
    t.integer  "role_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
