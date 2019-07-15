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

ActiveRecord::Schema.define(version: 2019_07_15_144445) do

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

  create_table "agreement_research_projects", force: :cascade do |t|
    t.string "code"
    t.date "year"
    t.date "startDate"
    t.date "approbationDate"
    t.date "estimatedFinishDate"
    t.date "closingDate"
    t.integer "research_group_id"
    t.integer "agreement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_agreement_research_projects_on_agreement_id"
    t.index ["research_group_id"], name: "index_agreement_research_projects_on_research_group_id"
  end

  create_table "agreement_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agreement_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agreements", force: :cascade do |t|
    t.string "name"
    t.date "registerDate"
    t.date "startDate"
    t.date "finalDate"
    t.integer "agreementNumber"
    t.integer "faculty_id"
    t.integer "research_group_id"
    t.integer "agreement_status_id"
    t.integer "agreement_type_id"
    t.integer "funding_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_status_id"], name: "index_agreements_on_agreement_status_id"
    t.index ["agreement_type_id"], name: "index_agreements_on_agreement_type_id"
    t.index ["faculty_id"], name: "index_agreements_on_faculty_id"
    t.index ["funding_entity_id"], name: "index_agreements_on_funding_entity_id"
    t.index ["research_group_id"], name: "index_agreements_on_research_group_id"
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

  create_table "curricular_projects_research_seedbeds", id: false, force: :cascade do |t|
    t.integer "research_seedbed_id", null: false
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

  create_table "faculties_research_seedbeds", id: false, force: :cascade do |t|
    t.integer "research_seedbed_id", null: false
    t.integer "faculty_id", null: false
  end

  create_table "funding_entities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_colciencias_ranks", force: :cascade do |t|
    t.integer "colciencias_call_id"
    t.integer "colciencias_category_id"
    t.integer "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colciencias_call_id"], name: "index_historical_colciencias_ranks_on_colciencias_call_id"
    t.index ["colciencias_category_id"], name: "index_historical_colciencias_ranks_on_colciencias_category_id"
    t.index ["research_group_id"], name: "index_historical_colciencias_ranks_on_research_group_id"
  end

  create_table "member_seedbeds", force: :cascade do |t|
    t.date "initialDate"
    t.date "finalDate"
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_seedbed_id"
    t.integer "state_reseacher_id"
    t.integer "researcher_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_seedbed_id"], name: "index_member_seedbeds_on_research_seedbed_id"
    t.index ["researcher_id"], name: "index_member_seedbeds_on_researcher_id"
    t.index ["researcher_type_id"], name: "index_member_seedbeds_on_researcher_type_id"
    t.index ["role_id"], name: "index_member_seedbeds_on_role_id"
    t.index ["state_reseacher_id"], name: "index_member_seedbeds_on_state_reseacher_id"
  end

  create_table "members", force: :cascade do |t|
    t.date "initialDate"
    t.date "finalDate"
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_researcher_id"
    t.index ["research_group_id"], name: "index_members_on_research_group_id"
    t.index ["researcher_id"], name: "index_members_on_researcher_id"
    t.index ["role_id"], name: "index_members_on_role_id"
    t.index ["state_researcher_id"], name: "index_members_on_state_researcher_id"
  end

  create_table "plan_periods", force: :cascade do |t|
    t.string "description"
    t.integer "planable_id"
    t.string "planable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planable_id"], name: "index_plan_periods_on_planable_id"
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

  create_table "research_focuses_seedbeds", id: false, force: :cascade do |t|
    t.integer "research_seedbed_id", null: false
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

  create_table "research_project_plans", force: :cascade do |t|
    t.string "activity"
    t.text "description"
    t.text "goal"
    t.integer "plan_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_period_id"], name: "index_research_project_plans_on_plan_period_id"
  end

  create_table "research_seedbeds", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "description"
    t.date "cidcRegistrationDate"
    t.date "facultyRegistrationDate"
    t.integer "cidcActNumber"
    t.integer "facultyActNumber"
    t.integer "state_seedbed_id"
    t.string "mail"
    t.string "webpage"
    t.string "mission"
    t.string "vision"
    t.integer "snies_id"
    t.integer "researcher_focus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["researcher_focus_id"], name: "index_research_seedbeds_on_researcher_focus_id"
    t.index ["snies_id"], name: "index_research_seedbeds_on_snies_id"
    t.index ["state_seedbed_id"], name: "index_research_seedbeds_on_state_seedbed_id"
  end

  create_table "researcher_formation_plans", force: :cascade do |t|
    t.string "activity"
    t.text "description"
    t.text "goal"
    t.integer "plan_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_period_id"], name: "index_researcher_formation_plans_on_plan_period_id"
  end

  create_table "researcher_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "telNumber"
    t.string "celNumber"
    t.string "address"
    t.string "academicEmail"
    t.string "personalEmail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "researcher_type_id"
    t.index ["curricular_project_id"], name: "index_researchers_on_curricular_project_id"
    t.index ["document_type_id"], name: "index_researchers_on_document_type_id"
    t.index ["faculty_id"], name: "index_researchers_on_faculty_id"
    t.index ["genre_id"], name: "index_researchers_on_genre_id"
    t.index ["researcher_type_id"], name: "index_researchers_on_researcher_type_id"
    t.index ["snies_id"], name: "index_researchers_on_snies_id"
  end

  create_table "result_transfer_plans", force: :cascade do |t|
    t.string "activity"
    t.text "description"
    t.text "goal"
    t.integer "plan_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_period_id"], name: "index_result_transfer_plans_on_plan_period_id"
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

  create_table "social_appropriation_plans", force: :cascade do |t|
    t.string "activity"
    t.text "description"
    t.text "goal"
    t.integer "plan_period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_period_id"], name: "index_social_appropriation_plans_on_plan_period_id"
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

  create_table "state_seedbeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
