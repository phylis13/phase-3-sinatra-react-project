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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_121336) do
    create_table "pets", force: :cascade do |t|
      t.string "name", null: false
      t.string "description", null: false
      t.string "breeds", null: false
      t.string "type"
      t.string "species", null: false
      t.string "contact", null: false
      t.string "photos", null: false
      t.datetime "due"
      t.datetime "createdAt", null: false
      t.integer "status", default: 0, null: false
    end
  
  end
  