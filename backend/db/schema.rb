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

ActiveRecord::Schema.define(version: 2018_07_10_152200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "quiz_id"
    t.integer "user_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["quiz_id"], name: "index_answers_on_quiz_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.text "choices", default: [], array: true
    t.integer "right_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_quizzes", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questions_quizzes_on_question_id"
    t.index ["quiz_id"], name: "index_questions_quizzes_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "score_boards", force: :cascade do |t|
    t.integer "score"
    t.bigint "user_id"
    t.bigint "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_score_boards_on_quiz_id"
    t.index ["user_id"], name: "index_score_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "quizzes"
  add_foreign_key "questions_quizzes", "questions"
  add_foreign_key "questions_quizzes", "quizzes"
  add_foreign_key "quizzes", "users"
  add_foreign_key "score_boards", "quizzes"
  add_foreign_key "score_boards", "users"
end
