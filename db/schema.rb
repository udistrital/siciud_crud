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

ActiveRecord::Schema.define(version: 2019_05_07_162950) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "colciencias_calls", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colciencias_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curricular_projects", force: :cascade do |t|
    t.string "name"
    t.integer "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_curricular_projects_on_faculty_id"
  end

  create_table "curricular_projects_research_groups", id: false, force: :cascade do |t|
    t.integer "research_group_id", null: false
    t.integer "curricular_project_id", null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties_research_groups", id: false, force: :cascade do |t|
    t.integer "research_group_id", null: false
    t.integer "faculty_id", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.date "initialDate"
    t.date "finalDate"
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_group_id"], name: "index_members_on_research_group_id"
    t.index ["researcher_id"], name: "index_members_on_researcher_id"
    t.index ["role_id"], name: "index_members_on_role_id"
  end

  create_table "research_focuses", force: :cascade do |t|
    t.string "name"
    t.integer "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_research_focuses_on_faculty_id"
  end

  create_table "research_focuses_groups", id: false, force: :cascade do |t|
    t.integer "research_group_id", null: false
    t.integer "research_focus_id", null: false
  end

  create_table "research_groups", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "description"
    t.date "cidcRegistrationDate"
    t.integer "cidcActNumber"
    t.integer "facultyActNumber"
    t.date "facultyRegistrationDate"
    t.integer "state_group_id"
    t.integer "snies_id"
    t.string "email"
    t.string "gruplac"
    t.string "webpage"
    t.text "mission"
    t.text "vision"
    t.string "colcienciasCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snies_id"], name: "index_research_groups_on_snies_id"
    t.index ["state_group_id"], name: "index_research_groups_on_state_group_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.integer "codeNumber"
    t.integer "identificationNumber"
    t.string "name"
    t.string "lastName"
    t.integer "document_type_id"
    t.string "birthPlace"
    t.integer "faculty_id"
    t.integer "curricular_project_id"
    t.integer "snies_id"
    t.integer "genre_id"
    t.integer "state_researcher_id"
    t.string "telNumber"
    t.string "celNumber"
    t.string "address"
    t.string "academicEmail"
    t.string "personalEmail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curricular_project_id"], name: "index_researchers_on_curricular_project_id"
    t.index ["document_type_id"], name: "index_researchers_on_document_type_id"
    t.index ["faculty_id"], name: "index_researchers_on_faculty_id"
    t.index ["genre_id"], name: "index_researchers_on_genre_id"
    t.index ["snies_id"], name: "index_researchers_on_snies_id"
    t.index ["state_researcher_id"], name: "index_researchers_on_state_researcher_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snies", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_researchers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
