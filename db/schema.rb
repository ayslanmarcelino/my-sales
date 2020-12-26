# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_26_070817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enterprises", force: :cascade do |t|
    t.string "description"
    t.string "primary_color"
    t.string "secondary_color"
    t.string "document_number"
    t.string "company_name"
    t.string "fantasy_name"
    t.string "email"
    t.date "opening_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["document_number"], name: "index_enterprises_on_document_number", unique: true
  end

end
