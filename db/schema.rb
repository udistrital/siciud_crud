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

ActiveRecord::Schema.define(version: 2021_04_19_224250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "name"
    t.string "year"
    t.date "startDate"
    t.date "approbationDate"
    t.date "estimatedFinishDate"
    t.date "closingDate"
    t.integer "agreement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_agreement_research_projects_on_agreement_id"
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
    t.text "description"
    t.integer "duration"
    t.integer "availability"
    t.integer "bizagiNumber"
    t.date "registerDate"
    t.date "startDate"
    t.date "finalDate"
    t.integer "agreementNumber"
    t.integer "agreement_status_id"
    t.integer "agreement_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_status_id"], name: "index_agreements_on_agreement_status_id"
    t.index ["agreement_type_id"], name: "index_agreements_on_agreement_type_id"
  end

  create_table "agreements_group_members", id: false, force: :cascade do |t|
    t.integer "agreement_id", null: false
    t.integer "group_member_id", null: false
  end

  create_table "agreements_research_groups", id: false, force: :cascade do |t|
    t.integer "agreement_id", null: false
    t.integer "research_group_id", null: false
  end

  create_table "arp_act_s_goals", force: :cascade do |t|
    t.integer "weight"
    t.integer "arp_activity_id"
    t.integer "arp_specific_goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arp_activity_id"], name: "index_arp_act_s_goals_on_arp_activity_id"
    t.index ["arp_specific_goal_id"], name: "index_arp_act_s_goals_on_arp_specific_goal_id"
  end

  create_table "arp_activities", force: :cascade do |t|
    t.text "activity"
    t.float "completedPercentage"
    t.date "startDate"
    t.date "finishDate"
    t.integer "agreement_research_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_research_project_id"], name: "index_arp_activities_on_agreement_research_project_id"
  end

  create_table "arp_activity_reports", force: :cascade do |t|
    t.integer "arp_activity_id"
    t.float "completedPercentage"
    t.integer "status"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arp_activity_id"], name: "index_arp_activity_reports_on_arp_activity_id"
  end

  create_table "arp_assignment_reports", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.integer "percentage"
    t.integer "status"
    t.bigint "arp_assignment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arp_assignment_id"], name: "index_arp_assignment_reports_on_arp_assignment_id"
  end

  create_table "arp_assignments", force: :cascade do |t|
    t.bigint "agreement_research_project_id"
    t.integer "completedPercentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_research_project_id"], name: "index_arp_assignments_on_agreement_research_project_id"
  end

  create_table "arp_expenses", force: :cascade do |t|
    t.string "name"
    t.float "totalPayed"
    t.float "remaining"
    t.string "description"
    t.date "date"
    t.boolean "is_payed"
    t.string "code"
    t.string "bizagiCode"
    t.integer "contribution_rp_item_id"
    t.float "inKindValue"
    t.float "inCashValue"
    t.float "totalPayedInCash"
    t.float "totalPayedInKind"
    t.float "remainingInCash"
    t.float "remainingInKind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_rp_item_id"], name: "index_arp_expenses_on_contribution_rp_item_id"
  end

  create_table "arp_general_goals", force: :cascade do |t|
    t.text "goal"
    t.integer "agreement_research_project_id"
    t.float "completedPercentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_research_project_id"], name: "index_arp_general_goals_on_agreement_research_project_id"
  end

  create_table "arp_members", force: :cascade do |t|
    t.integer "arp_role_id"
    t.integer "agreement_id"
    t.integer "group_member_id"
    t.integer "agreement_research_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_arp_members_on_agreement_id"
    t.index ["agreement_research_project_id"], name: "index_arp_members_on_agreement_research_project_id"
    t.index ["arp_role_id"], name: "index_arp_members_on_arp_role_id"
    t.index ["group_member_id"], name: "index_arp_members_on_group_member_id"
  end

  create_table "arp_payments", force: :cascade do |t|
    t.integer "inCashValue"
    t.integer "inKindValue"
    t.date "date"
    t.string "bizagiCode"
    t.integer "arp_expense_id"
    t.string "cdpCode"
    t.string "rpCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arp_expense_id"], name: "index_arp_payments_on_arp_expense_id"
  end

  create_table "arp_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arp_specific_goals", force: :cascade do |t|
    t.text "goal"
    t.integer "arp_general_goal_id"
    t.float "completedPercentage"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arp_general_goal_id"], name: "index_arp_specific_goals_on_arp_general_goal_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.boolean "is_national"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "research_creation_work_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_awards_on_created_by"
    t.index ["research_creation_work_id"], name: "index_awards_on_research_creation_work_id"
    t.index ["updated_by"], name: "index_awards_on_updated_by"
  end

  create_table "book_chapters", force: :cascade do |t|
    t.string "book_title"
    t.string "title"
    t.date "publication_date"
    t.string "isbn"
    t.string "doi"
    t.string "url"
    t.text "observation"
    t.bigint "editorial_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.index ["category_id"], name: "index_book_chapters_on_category_id"
    t.index ["colciencias_call_id"], name: "index_book_chapters_on_colciencias_call_id"
    t.index ["created_by"], name: "index_book_chapters_on_created_by"
    t.index ["editorial_id"], name: "index_book_chapters_on_editorial_id"
    t.index ["geo_city_id"], name: "index_book_chapters_on_geo_city_id"
    t.index ["research_group_id"], name: "index_book_chapters_on_research_group_id"
    t.index ["updated_by"], name: "index_book_chapters_on_updated_by"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "publication_date"
    t.string "isbn"
    t.string "url"
    t.text "observation"
    t.bigint "editorial_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["colciencias_call_id"], name: "index_books_on_colciencias_call_id"
    t.index ["created_by"], name: "index_books_on_created_by"
    t.index ["editorial_id"], name: "index_books_on_editorial_id"
    t.index ["geo_city_id"], name: "index_books_on_geo_city_id"
    t.index ["research_group_id"], name: "index_books_on_research_group_id"
    t.index ["updated_by"], name: "index_books_on_updated_by"
  end

  create_table "call_item_categories", force: :cascade do |t|
    t.float "percentage"
    t.float "value"
    t.float "maximum_percentage"
    t.bigint "call_id"
    t.bigint "item_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_call_item_categories_on_call_id"
    t.index ["item_category_id"], name: "index_call_item_categories_on_item_category_id"
  end

  create_table "call_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "call_user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calls", force: :cascade do |t|
    t.integer "callNumber"
    t.date "registerDate"
    t.string "name"
    t.text "description"
    t.bigint "call_type_id"
    t.bigint "call_user_role_id"
    t.integer "duration"
    t.bigint "duration_type_id"
    t.float "globalBudget"
    t.float "maxBudgetPerProject"
    t.date "startDate"
    t.date "closingDate"
    t.text "directedTowards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_type_id"], name: "index_calls_on_call_type_id"
    t.index ["call_user_role_id"], name: "index_calls_on_call_user_role_id"
    t.index ["duration_type_id"], name: "index_calls_on_duration_type_id"
  end

  create_table "calls_product_types", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "call_id"
    t.text "alternate_indicator"
    t.bigint "required_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_calls_product_types_on_call_id"
    t.index ["required_type_id"], name: "index_calls_product_types_on_required_type_id"
  end

  create_table "calls_required_documents", force: :cascade do |t|
    t.boolean "required"
    t.bigint "call_id"
    t.bigint "required_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_calls_required_documents_on_call_id"
    t.index ["required_document_id"], name: "index_calls_required_documents_on_required_document_id"
  end

  create_table "cine_broad_areas", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_cine_broad_areas_on_created_by"
    t.index ["updated_by"], name: "index_cine_broad_areas_on_updated_by"
  end

  create_table "cine_detailed_areas", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.bigint "cine_specific_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["cine_specific_area_id"], name: "index_cine_detailed_areas_on_cine_specific_area_id"
    t.index ["created_by"], name: "index_cine_detailed_areas_on_created_by"
    t.index ["updated_by"], name: "index_cine_detailed_areas_on_updated_by"
  end

  create_table "cine_detailed_areas_research_groups", id: false, force: :cascade do |t|
    t.bigint "research_group_id", null: false
    t.bigint "cine_detailed_area_id", null: false
  end

  create_table "cine_specific_areas", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "cine_broad_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["cine_broad_area_id"], name: "index_cine_specific_areas_on_cine_broad_area_id"
    t.index ["created_by"], name: "index_cine_specific_areas_on_created_by"
    t.index ["updated_by"], name: "index_cine_specific_areas_on_updated_by"
  end

  create_table "colciencias_calls", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_colciencias_calls_on_created_by"
    t.index ["updated_by"], name: "index_colciencias_calls_on_updated_by"
  end

  create_table "colciencias_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_colciencias_categories_on_created_by"
    t.index ["updated_by"], name: "index_colciencias_categories_on_updated_by"
  end

  create_table "contribution_funding_entity_items", force: :cascade do |t|
    t.float "cashValue"
    t.float "inKindValue"
    t.integer "item_category_id"
    t.integer "contribution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contribution_id"], name: "index_contribution_funding_entity_items_on_contribution_id"
    t.index ["item_category_id"], name: "index_contribution_funding_entity_items_on_item_category_id"
  end

  create_table "contribution_rp_items", force: :cascade do |t|
    t.float "cashValue"
    t.float "inKindValue"
    t.integer "agreement_research_project_id"
    t.integer "contribution_funding_entity_item_id"
    t.float "executedCash"
    t.float "executedInKind"
    t.float "remainingCash"
    t.float "remainingInKind"
    t.float "compromisedCash"
    t.float "compromisedInKind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_research_project_id"], name: "index_contribution_rp_items_on_agreement_research_project_id"
    t.index ["contribution_funding_entity_item_id"], name: "index_contribution_rp_items_on_cont_funding_entity_item_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer "funding_entity_id"
    t.integer "agreement_id"
    t.float "inKindContribution"
    t.float "cashContribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_id"], name: "index_contributions_on_agreement_id"
    t.index ["funding_entity_id"], name: "index_contributions_on_funding_entity_id"
  end

  create_table "curricular_prj_ids_research_groups", force: :cascade do |t|
    t.bigint "research_group_id"
    t.integer "curricular_project_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_curricular_prj_ids_research_groups_on_created_by"
    t.index ["research_group_id"], name: "index_curricular_prj_ids_research_groups_on_research_group_id"
    t.index ["updated_by"], name: "index_curricular_prj_ids_research_groups_on_updated_by"
  end

  create_table "cycle_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_cycle_types_on_created_by"
    t.index ["updated_by"], name: "index_cycle_types_on_updated_by"
  end

  create_table "degree_works", force: :cascade do |t|
    t.string "dw_title"
    t.date "dw_date"
    t.string "dw_institution_name"
    t.string "dw_recognition"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "dw_observation"
    t.bigint "dw_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_degree_works_on_category_id"
    t.index ["colciencias_call_id"], name: "index_degree_works_on_colciencias_call_id"
    t.index ["created_by"], name: "index_degree_works_on_created_by"
    t.index ["dw_type_id"], name: "index_degree_works_on_dw_type_id"
    t.index ["research_group_id"], name: "index_degree_works_on_research_group_id"
    t.index ["updated_by"], name: "index_degree_works_on_updated_by"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.string "doc_name", null: false
    t.string "doc_path", null: false
    t.bigint "doc_size", comment: "file size in bytes"
    t.bigint "document_type_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.string "nuxeo_id"
    t.index ["created_by"], name: "index_documents_on_created_by"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
    t.index ["updated_by"], name: "index_documents_on_updated_by"
  end

  create_table "duration_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editorials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_editorials_on_created_by"
    t.index ["updated_by"], name: "index_editorials_on_updated_by"
  end

  create_table "entity_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "eve_name"
    t.date "eve_start_date"
    t.date "eve_finish_date"
    t.string "eve_organizers"
    t.string "eve_entities"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "eve_observation"
    t.bigint "eve_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["colciencias_call_id"], name: "index_events_on_colciencias_call_id"
    t.index ["created_by"], name: "index_events_on_created_by"
    t.index ["eve_type_id"], name: "index_events_on_eve_type_id"
    t.index ["research_group_id"], name: "index_events_on_research_group_id"
    t.index ["updated_by"], name: "index_events_on_updated_by"
  end

  create_table "ext_participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "producible_type"
    t.bigint "producible_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "participant_type_id"
    t.index ["created_by"], name: "index_ext_participants_on_created_by"
    t.index ["participant_type_id"], name: "index_ext_participants_on_participant_type_id"
    t.index ["producible_type", "producible_id"], name: "index_ext_participants_on_producible_type_and_producible_id"
    t.index ["updated_by"], name: "index_ext_participants_on_updated_by"
  end

  create_table "faculty_ids_research_groups", force: :cascade do |t|
    t.bigint "research_group_id"
    t.integer "faculty_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_faculty_ids_research_groups_on_created_by"
    t.index ["research_group_id"], name: "index_faculty_ids_research_groups_on_research_group_id"
    t.index ["updated_by"], name: "index_faculty_ids_research_groups_on_updated_by"
  end

  create_table "fe_contacts", force: :cascade do |t|
    t.string "name"
    t.string "lastName"
    t.string "phoneNumber"
    t.string "mobileNumber"
    t.string "role"
    t.string "email"
    t.integer "funding_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funding_entity_id"], name: "index_fe_contacts_on_funding_entity_id"
  end

  create_table "funding_entities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "phoneNumber"
    t.string "mobileNumber"
    t.integer "entity_type_id"
    t.text "observation"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type_id"], name: "index_funding_entities_on_entity_type_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geo_cities", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 10
    t.float "latitude"
    t.float "longitude"
    t.bigint "geo_state_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_geo_cities_on_created_by"
    t.index ["geo_state_id"], name: "index_geo_cities_on_geo_state_id"
    t.index ["updated_by"], name: "index_geo_cities_on_updated_by"
  end

  create_table "geo_countries", force: :cascade do |t|
    t.string "name"
    t.string "iso2", limit: 2
    t.string "iso3", limit: 3
    t.string "capital_name", limit: 255
    t.string "currency", limit: 10
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_geo_countries_on_created_by"
    t.index ["updated_by"], name: "index_geo_countries_on_updated_by"
  end

  create_table "geo_countries_patents", id: false, force: :cascade do |t|
    t.bigint "geo_country_id", null: false
    t.bigint "patent_id", null: false
  end

  create_table "geo_states", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 10
    t.bigint "geo_country_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_geo_states_on_created_by"
    t.index ["geo_country_id"], name: "index_geo_states_on_geo_country_id"
    t.index ["updated_by"], name: "index_geo_states_on_updated_by"
  end

  create_table "gm_periods", force: :cascade do |t|
    t.date "initial_date"
    t.date "final_date"
    t.integer "role_id"
    t.integer "group_member_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_gm_periods_on_created_by"
    t.index ["group_member_id"], name: "index_gm_periods_on_group_member_id"
    t.index ["role_id"], name: "index_gm_periods_on_role_id"
    t.index ["updated_by"], name: "index_gm_periods_on_updated_by"
  end

  create_table "gm_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_gm_states_on_created_by"
    t.index ["updated_by"], name: "index_gm_states_on_updated_by"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_group_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "gm_state_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_group_members_on_created_by"
    t.index ["gm_state_id"], name: "index_group_members_on_gm_state_id"
    t.index ["research_group_id"], name: "index_group_members_on_research_group_id"
    t.index ["researcher_id"], name: "index_group_members_on_researcher_id"
    t.index ["role_id"], name: "index_group_members_on_role_id"
    t.index ["updated_by"], name: "index_group_members_on_updated_by"
  end

  create_table "historical_colciencias_ranks", force: :cascade do |t|
    t.integer "colciencias_call_id"
    t.integer "colciencias_category_id"
    t.integer "research_group_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "oecd_knowledge_area_id"
    t.bigint "oecd_knowledge_subarea_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["colciencias_call_id"], name: "index_historical_colciencias_ranks_on_colciencias_call_id"
    t.index ["colciencias_category_id"], name: "index_historical_colciencias_ranks_on_colciencias_category_id"
    t.index ["created_by"], name: "index_historical_colciencias_ranks_on_created_by"
    t.index ["oecd_knowledge_area_id"], name: "index_historical_colciencias_ranks_on_oecd_knowledge_area_id"
    t.index ["oecd_knowledge_subarea_id"], name: "index_historical_colciencias_ranks_on_oecd_knowledge_subarea_id"
    t.index ["research_group_id"], name: "index_historical_colciencias_ranks_on_research_group_id"
    t.index ["updated_by"], name: "index_historical_colciencias_ranks_on_updated_by"
  end

  create_table "industrial_designs", force: :cascade do |t|
    t.string "ind_dsg_registration_number"
    t.string "ind_dsg_registration_title"
    t.date "ind_dsg_date_of_obtaining"
    t.string "ind_dsg_industrial_publication_gazette"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.index ["category_id"], name: "index_industrial_designs_on_category_id"
    t.index ["colciencias_call_id"], name: "index_industrial_designs_on_colciencias_call_id"
    t.index ["created_by"], name: "index_industrial_designs_on_created_by"
    t.index ["geo_city_id"], name: "index_industrial_designs_on_geo_city_id"
    t.index ["research_group_id"], name: "index_industrial_designs_on_research_group_id"
    t.index ["updated_by"], name: "index_industrial_designs_on_updated_by"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "inst_name"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_institutions_on_created_by"
    t.index ["updated_by"], name: "index_institutions_on_updated_by"
  end

  create_table "int_participants", force: :cascade do |t|
    t.string "producible_type"
    t.bigint "producible_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "researcher_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "participant_type_id"
    t.index ["created_by"], name: "index_int_participants_on_created_by"
    t.index ["participant_type_id"], name: "index_int_participants_on_participant_type_id"
    t.index ["producible_type", "producible_id"], name: "index_int_participants_on_producible_type_and_producible_id"
    t.index ["researcher_id"], name: "index_int_participants_on_researcher_id"
    t.index ["updated_by"], name: "index_int_participants_on_updated_by"
  end

  create_table "integrated_circuit_diagrams", force: :cascade do |t|
    t.string "icd_registration_number"
    t.string "icd_registration_title"
    t.date "icd_date_of_obtaining"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.index ["category_id"], name: "index_integrated_circuit_diagrams_on_category_id"
    t.index ["colciencias_call_id"], name: "index_integrated_circuit_diagrams_on_colciencias_call_id"
    t.index ["created_by"], name: "index_integrated_circuit_diagrams_on_created_by"
    t.index ["geo_city_id"], name: "index_integrated_circuit_diagrams_on_geo_city_id"
    t.index ["research_group_id"], name: "index_integrated_circuit_diagrams_on_research_group_id"
    t.index ["updated_by"], name: "index_integrated_circuit_diagrams_on_updated_by"
  end

  create_table "ip_livestock_breeds", force: :cascade do |t|
    t.string "name"
    t.date "publication_date"
    t.string "consecutive_number_ma"
    t.text "observation"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.index ["category_id"], name: "index_ip_livestock_breeds_on_category_id"
    t.index ["colciencias_call_id"], name: "index_ip_livestock_breeds_on_colciencias_call_id"
    t.index ["created_by"], name: "index_ip_livestock_breeds_on_created_by"
    t.index ["geo_city_id"], name: "index_ip_livestock_breeds_on_geo_city_id"
    t.index ["research_group_id"], name: "index_ip_livestock_breeds_on_research_group_id"
    t.index ["updated_by"], name: "index_ip_livestock_breeds_on_updated_by"
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_journals_on_created_by"
    t.index ["updated_by"], name: "index_journals_on_updated_by"
  end

  create_table "knwl_spec_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_knwl_spec_areas_on_created_by"
    t.index ["updated_by"], name: "index_knwl_spec_areas_on_updated_by"
  end

  create_table "new_animal_breeds", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "observation"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.bigint "cycle_type_id"
    t.bigint "petition_status_id"
    t.index ["category_id"], name: "index_new_animal_breeds_on_category_id"
    t.index ["colciencias_call_id"], name: "index_new_animal_breeds_on_colciencias_call_id"
    t.index ["created_by"], name: "index_new_animal_breeds_on_created_by"
    t.index ["cycle_type_id"], name: "index_new_animal_breeds_on_cycle_type_id"
    t.index ["geo_city_id"], name: "index_new_animal_breeds_on_geo_city_id"
    t.index ["petition_status_id"], name: "index_new_animal_breeds_on_petition_status_id"
    t.index ["research_group_id"], name: "index_new_animal_breeds_on_research_group_id"
    t.index ["updated_by"], name: "index_new_animal_breeds_on_updated_by"
  end

  create_table "new_scientific_records", force: :cascade do |t|
    t.string "nsr_name"
    t.date "nsr_date_of_obtaining"
    t.string "nsr_database_name"
    t.string "nsr_database_url"
    t.string "nsr_certifying_institution"
    t.string "nsr_issuing_institution"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.index ["category_id"], name: "index_new_scientific_records_on_category_id"
    t.index ["colciencias_call_id"], name: "index_new_scientific_records_on_colciencias_call_id"
    t.index ["created_by"], name: "index_new_scientific_records_on_created_by"
    t.index ["geo_city_id"], name: "index_new_scientific_records_on_geo_city_id"
    t.index ["research_group_id"], name: "index_new_scientific_records_on_research_group_id"
    t.index ["updated_by"], name: "index_new_scientific_records_on_updated_by"
  end

  create_table "oecd_disciplines", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "oecd_knowledge_subarea_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_oecd_disciplines_on_created_by"
    t.index ["oecd_knowledge_subarea_id"], name: "index_oecd_disciplines_on_oecd_knowledge_subarea_id"
    t.index ["updated_by"], name: "index_oecd_disciplines_on_updated_by"
  end

  create_table "oecd_disciplines_research_groups", id: false, force: :cascade do |t|
    t.bigint "research_group_id", null: false
    t.bigint "oecd_discipline_id", null: false
  end

  create_table "oecd_knowledge_areas", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_oecd_knowledge_areas_on_created_by"
    t.index ["updated_by"], name: "index_oecd_knowledge_areas_on_updated_by"
  end

  create_table "oecd_knowledge_subareas", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "oecd_knowledge_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_oecd_knowledge_subareas_on_created_by"
    t.index ["oecd_knowledge_area_id"], name: "index_oecd_knowledge_subareas_on_oecd_knowledge_area_id"
    t.index ["updated_by"], name: "index_oecd_knowledge_subareas_on_updated_by"
  end

  create_table "paper_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_paper_types_on_created_by"
    t.index ["updated_by"], name: "index_paper_types_on_updated_by"
  end

  create_table "papers", force: :cascade do |t|
    t.string "title"
    t.date "publication_date"
    t.date "approval_date"
    t.string "volume"
    t.integer "number_of_pages"
    t.integer "initial_page"
    t.integer "final_page"
    t.string "issn"
    t.string "url"
    t.string "doi"
    t.text "observation"
    t.bigint "journal_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "paper_type_id"
    t.bigint "colciencias_call_id"
    t.index ["category_id"], name: "index_papers_on_category_id"
    t.index ["colciencias_call_id"], name: "index_papers_on_colciencias_call_id"
    t.index ["created_by"], name: "index_papers_on_created_by"
    t.index ["geo_city_id"], name: "index_papers_on_geo_city_id"
    t.index ["journal_id"], name: "index_papers_on_journal_id"
    t.index ["paper_type_id"], name: "index_papers_on_paper_type_id"
    t.index ["research_group_id"], name: "index_papers_on_research_group_id"
    t.index ["updated_by"], name: "index_papers_on_updated_by"
  end

  create_table "participant_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_participant_types_on_created_by"
    t.index ["updated_by"], name: "index_participant_types_on_updated_by"
  end

  create_table "patent_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_patent_states_on_created_by"
    t.index ["updated_by"], name: "index_patent_states_on_updated_by"
  end

  create_table "patents", force: :cascade do |t|
    t.string "patent_number"
    t.string "title"
    t.date "date_of_obtaining"
    t.string "industrial_publication_gazette"
    t.text "observation"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.bigint "patent_state_id"
    t.index ["category_id"], name: "index_patents_on_category_id"
    t.index ["colciencias_call_id"], name: "index_patents_on_colciencias_call_id"
    t.index ["created_by"], name: "index_patents_on_created_by"
    t.index ["patent_state_id"], name: "index_patents_on_patent_state_id"
    t.index ["research_group_id"], name: "index_patents_on_research_group_id"
    t.index ["updated_by"], name: "index_patents_on_updated_by"
  end

  create_table "petition_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_petition_statuses_on_created_by"
    t.index ["updated_by"], name: "index_petition_statuses_on_updated_by"
  end

  create_table "plan_periods", force: :cascade do |t|
    t.string "description"
    t.integer "planable_id"
    t.string "planable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planable_id"], name: "index_plan_periods_on_planable_id"
  end

  create_table "plant_ind_prototypes", force: :cascade do |t|
    t.string "plt_name"
    t.string "plt_registration_number"
    t.date "plt_date_of_elaboration"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.bigint "plt_type_id"
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "institution_name"
    t.index ["category_id"], name: "index_plant_ind_prototypes_on_category_id"
    t.index ["colciencias_call_id"], name: "index_plant_ind_prototypes_on_colciencias_call_id"
    t.index ["created_by"], name: "index_plant_ind_prototypes_on_created_by"
    t.index ["geo_city_id"], name: "index_plant_ind_prototypes_on_geo_city_id"
    t.index ["plt_type_id"], name: "index_plant_ind_prototypes_on_plt_type_id"
    t.index ["research_group_id"], name: "index_plant_ind_prototypes_on_research_group_id"
    t.index ["updated_by"], name: "index_plant_ind_prototypes_on_updated_by"
  end

  create_table "required_documents", force: :cascade do |t|
    t.string "document_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "required_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_creation_works", force: :cascade do |t|
    t.string "title"
    t.date "creation_and_selection_date"
    t.string "nature_of_work"
    t.string "registered_project_title"
    t.string "url"
    t.text "observation"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.bigint "knwl_spec_area_id"
    t.index ["category_id"], name: "index_research_creation_works_on_category_id"
    t.index ["colciencias_call_id"], name: "index_research_creation_works_on_colciencias_call_id"
    t.index ["created_by"], name: "index_research_creation_works_on_created_by"
    t.index ["geo_city_id"], name: "index_research_creation_works_on_geo_city_id"
    t.index ["knwl_spec_area_id"], name: "index_research_creation_works_on_knwl_spec_area_id"
    t.index ["research_group_id"], name: "index_research_creation_works_on_research_group_id"
    t.index ["updated_by"], name: "index_research_creation_works_on_updated_by"
  end

  create_table "research_creation_works_work_types", id: false, force: :cascade do |t|
    t.bigint "research_creation_work_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "research_focuses_units", id: false, force: :cascade do |t|
    t.bigint "subtype_id", null: false
    t.bigint "research_group_id", null: false
  end

  create_table "research_groups", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.text "description"
    t.date "cidc_registration_date"
    t.string "cidc_act_number"
    t.string "faculty_act_number"
    t.date "faculty_registration_date"
    t.string "email"
    t.string "gruplac"
    t.string "webpage"
    t.text "mission"
    t.text "vision"
    t.string "colciencias_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "snies_id"
    t.boolean "interinstitutional"
    t.bigint "cine_broad_area_id"
    t.bigint "cine_specific_area_id"
    t.bigint "oecd_knowledge_subarea_id"
    t.bigint "oecd_knowledge_area_id"
    t.integer "legacy_siciud_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "group_state_id"
    t.bigint "group_type_id"
    t.index ["cine_broad_area_id"], name: "index_research_groups_on_cine_broad_area_id"
    t.index ["cine_specific_area_id"], name: "index_research_groups_on_cine_specific_area_id"
    t.index ["created_by"], name: "index_research_groups_on_created_by"
    t.index ["group_state_id"], name: "index_research_groups_on_group_state_id"
    t.index ["group_type_id"], name: "index_research_groups_on_group_type_id"
    t.index ["oecd_knowledge_area_id"], name: "index_research_groups_on_oecd_knowledge_area_id"
    t.index ["oecd_knowledge_subarea_id"], name: "index_research_groups_on_oecd_knowledge_subarea_id"
    t.index ["updated_by"], name: "index_research_groups_on_updated_by"
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
    t.string "webpage"
    t.string "mission"
    t.string "vision"
    t.integer "snies_id"
    t.integer "researcher_focus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "orcid_id"
    t.string "scientific_signature"
    t.string "identification_number"
    t.string "oas_researcher_id"
    t.string "mobile_number_one"
    t.string "address"
    t.string "mobile_number_two"
    t.string "phone_number_one"
    t.string "phone_number_two"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_researchers_on_created_by"
    t.index ["updated_by"], name: "index_researchers_on_updated_by"
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
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_roles_on_created_by"
    t.index ["updated_by"], name: "index_roles_on_updated_by"
  end

  create_table "scientific_notes", force: :cascade do |t|
    t.string "title"
    t.date "publication_date"
    t.string "volume"
    t.integer "number_of_pages"
    t.integer "initial_page"
    t.integer "final_page"
    t.string "issn"
    t.string "url"
    t.string "doi"
    t.text "observation"
    t.bigint "journal_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.date "approval_date"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.index ["category_id"], name: "index_scientific_notes_on_category_id"
    t.index ["colciencias_call_id"], name: "index_scientific_notes_on_colciencias_call_id"
    t.index ["created_by"], name: "index_scientific_notes_on_created_by"
    t.index ["geo_city_id"], name: "index_scientific_notes_on_geo_city_id"
    t.index ["journal_id"], name: "index_scientific_notes_on_journal_id"
    t.index ["research_group_id"], name: "index_scientific_notes_on_research_group_id"
    t.index ["updated_by"], name: "index_scientific_notes_on_updated_by"
  end

  create_table "seedbed_members", force: :cascade do |t|
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_seedbed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_researcher_id"
    t.index ["research_seedbed_id"], name: "index_seedbed_members_on_research_seedbed_id"
    t.index ["researcher_id"], name: "index_seedbed_members_on_researcher_id"
    t.index ["role_id"], name: "index_seedbed_members_on_role_id"
    t.index ["state_researcher_id"], name: "index_seedbed_members_on_state_researcher_id"
  end

  create_table "sm_periods", force: :cascade do |t|
    t.date "initialDate"
    t.date "finalDate"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seedbed_member_id"
    t.index ["role_id"], name: "index_sm_periods_on_role_id"
    t.index ["seedbed_member_id"], name: "index_sm_periods_on_seedbed_member_id"
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

  create_table "software", force: :cascade do |t|
    t.string "sof_registration_number"
    t.string "sof_product_title"
    t.date "sof_date_of_obtaining"
    t.text "sof_description"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.index ["category_id"], name: "index_software_on_category_id"
    t.index ["colciencias_call_id"], name: "index_software_on_colciencias_call_id"
    t.index ["created_by"], name: "index_software_on_created_by"
    t.index ["geo_city_id"], name: "index_software_on_geo_city_id"
    t.index ["research_group_id"], name: "index_software_on_research_group_id"
    t.index ["updated_by"], name: "index_software_on_updated_by"
  end

  create_table "state_seedbeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "st_name"
    t.text "st_description"
    t.bigint "parent_id"
    t.bigint "type_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_subtypes_on_created_by"
    t.index ["parent_id"], name: "index_subtypes_on_parent_id"
    t.index ["type_id"], name: "index_subtypes_on_type_id"
    t.index ["updated_by"], name: "index_subtypes_on_updated_by"
  end

  create_table "types", force: :cascade do |t|
    t.string "t_name", null: false
    t.text "t_description"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_types_on_created_by"
    t.index ["updated_by"], name: "index_types_on_updated_by"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_user_roles_on_created_by"
    t.index ["updated_by"], name: "index_user_roles_on_updated_by"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identification_number"
    t.string "oas_user_id"
    t.bigint "user_role_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_users_on_created_by"
    t.index ["updated_by"], name: "index_users_on_updated_by"
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
  end

  create_table "vegetable_varieties", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "observation"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.bigint "category_id"
    t.bigint "colciencias_call_id"
    t.bigint "cycle_type_id"
    t.bigint "petition_status_id"
    t.index ["category_id"], name: "index_vegetable_varieties_on_category_id"
    t.index ["colciencias_call_id"], name: "index_vegetable_varieties_on_colciencias_call_id"
    t.index ["created_by"], name: "index_vegetable_varieties_on_created_by"
    t.index ["cycle_type_id"], name: "index_vegetable_varieties_on_cycle_type_id"
    t.index ["geo_city_id"], name: "index_vegetable_varieties_on_geo_city_id"
    t.index ["petition_status_id"], name: "index_vegetable_varieties_on_petition_status_id"
    t.index ["research_group_id"], name: "index_vegetable_varieties_on_research_group_id"
    t.index ["updated_by"], name: "index_vegetable_varieties_on_updated_by"
  end

  create_table "work_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_work_types_on_created_by"
    t.index ["updated_by"], name: "index_work_types_on_updated_by"
  end

  add_foreign_key "arp_assignment_reports", "arp_assignments"
  add_foreign_key "arp_assignments", "agreement_research_projects"
  add_foreign_key "awards", "research_creation_works"
  add_foreign_key "awards", "users", column: "created_by"
  add_foreign_key "awards", "users", column: "updated_by"
  add_foreign_key "book_chapters", "colciencias_calls"
  add_foreign_key "book_chapters", "editorials"
  add_foreign_key "book_chapters", "geo_cities"
  add_foreign_key "book_chapters", "research_groups"
  add_foreign_key "book_chapters", "subtypes", column: "category_id"
  add_foreign_key "book_chapters", "users", column: "created_by"
  add_foreign_key "book_chapters", "users", column: "updated_by"
  add_foreign_key "books", "colciencias_calls"
  add_foreign_key "books", "editorials"
  add_foreign_key "books", "geo_cities"
  add_foreign_key "books", "research_groups"
  add_foreign_key "books", "subtypes", column: "category_id"
  add_foreign_key "books", "users", column: "created_by"
  add_foreign_key "books", "users", column: "updated_by"
  add_foreign_key "call_item_categories", "calls"
  add_foreign_key "call_item_categories", "item_categories"
  add_foreign_key "calls", "call_types"
  add_foreign_key "calls", "call_user_roles"
  add_foreign_key "calls", "duration_types"
  add_foreign_key "calls_product_types", "calls"
  add_foreign_key "calls_product_types", "required_types"
  add_foreign_key "calls_required_documents", "calls"
  add_foreign_key "calls_required_documents", "required_documents"
  add_foreign_key "cine_broad_areas", "users", column: "created_by"
  add_foreign_key "cine_broad_areas", "users", column: "updated_by"
  add_foreign_key "cine_detailed_areas", "cine_specific_areas"
  add_foreign_key "cine_detailed_areas", "users", column: "created_by"
  add_foreign_key "cine_detailed_areas", "users", column: "updated_by"
  add_foreign_key "cine_specific_areas", "cine_broad_areas"
  add_foreign_key "cine_specific_areas", "users", column: "created_by"
  add_foreign_key "cine_specific_areas", "users", column: "updated_by"
  add_foreign_key "colciencias_calls", "users", column: "created_by"
  add_foreign_key "colciencias_calls", "users", column: "updated_by"
  add_foreign_key "colciencias_categories", "users", column: "created_by"
  add_foreign_key "colciencias_categories", "users", column: "updated_by"
  add_foreign_key "curricular_prj_ids_research_groups", "research_groups"
  add_foreign_key "curricular_prj_ids_research_groups", "users", column: "created_by"
  add_foreign_key "curricular_prj_ids_research_groups", "users", column: "updated_by"
  add_foreign_key "cycle_types", "users", column: "created_by"
  add_foreign_key "cycle_types", "users", column: "updated_by"
  add_foreign_key "degree_works", "colciencias_calls"
  add_foreign_key "degree_works", "research_groups"
  add_foreign_key "degree_works", "subtypes", column: "category_id"
  add_foreign_key "degree_works", "subtypes", column: "dw_type_id"
  add_foreign_key "degree_works", "users", column: "created_by"
  add_foreign_key "degree_works", "users", column: "updated_by"
  add_foreign_key "documents", "subtypes", column: "document_type_id"
  add_foreign_key "documents", "users", column: "created_by"
  add_foreign_key "documents", "users", column: "updated_by"
  add_foreign_key "editorials", "users", column: "created_by"
  add_foreign_key "editorials", "users", column: "updated_by"
  add_foreign_key "events", "colciencias_calls"
  add_foreign_key "events", "research_groups"
  add_foreign_key "events", "subtypes", column: "category_id"
  add_foreign_key "events", "subtypes", column: "eve_type_id"
  add_foreign_key "events", "users", column: "created_by"
  add_foreign_key "events", "users", column: "updated_by"
  add_foreign_key "ext_participants", "subtypes", column: "participant_type_id"
  add_foreign_key "ext_participants", "users", column: "created_by"
  add_foreign_key "ext_participants", "users", column: "updated_by"
  add_foreign_key "faculty_ids_research_groups", "research_groups"
  add_foreign_key "faculty_ids_research_groups", "users", column: "created_by"
  add_foreign_key "faculty_ids_research_groups", "users", column: "updated_by"
  add_foreign_key "geo_cities", "geo_states"
  add_foreign_key "geo_cities", "users", column: "created_by"
  add_foreign_key "geo_cities", "users", column: "updated_by"
  add_foreign_key "geo_countries", "users", column: "created_by"
  add_foreign_key "geo_countries", "users", column: "updated_by"
  add_foreign_key "geo_states", "geo_countries"
  add_foreign_key "geo_states", "users", column: "created_by"
  add_foreign_key "geo_states", "users", column: "updated_by"
  add_foreign_key "gm_periods", "users", column: "created_by"
  add_foreign_key "gm_periods", "users", column: "updated_by"
  add_foreign_key "gm_states", "users", column: "created_by"
  add_foreign_key "gm_states", "users", column: "updated_by"
  add_foreign_key "group_members", "gm_states"
  add_foreign_key "group_members", "users", column: "created_by"
  add_foreign_key "group_members", "users", column: "updated_by"
  add_foreign_key "historical_colciencias_ranks", "oecd_knowledge_areas"
  add_foreign_key "historical_colciencias_ranks", "oecd_knowledge_subareas"
  add_foreign_key "historical_colciencias_ranks", "users", column: "created_by"
  add_foreign_key "historical_colciencias_ranks", "users", column: "updated_by"
  add_foreign_key "industrial_designs", "colciencias_calls"
  add_foreign_key "industrial_designs", "geo_cities"
  add_foreign_key "industrial_designs", "research_groups"
  add_foreign_key "industrial_designs", "subtypes", column: "category_id"
  add_foreign_key "industrial_designs", "users", column: "created_by"
  add_foreign_key "industrial_designs", "users", column: "updated_by"
  add_foreign_key "institutions", "users", column: "created_by"
  add_foreign_key "institutions", "users", column: "updated_by"
  add_foreign_key "int_participants", "researchers"
  add_foreign_key "int_participants", "subtypes", column: "participant_type_id"
  add_foreign_key "int_participants", "users", column: "created_by"
  add_foreign_key "int_participants", "users", column: "updated_by"
  add_foreign_key "integrated_circuit_diagrams", "colciencias_calls"
  add_foreign_key "integrated_circuit_diagrams", "geo_cities"
  add_foreign_key "integrated_circuit_diagrams", "research_groups"
  add_foreign_key "integrated_circuit_diagrams", "subtypes", column: "category_id"
  add_foreign_key "integrated_circuit_diagrams", "users", column: "created_by"
  add_foreign_key "integrated_circuit_diagrams", "users", column: "updated_by"
  add_foreign_key "ip_livestock_breeds", "colciencias_calls"
  add_foreign_key "ip_livestock_breeds", "geo_cities"
  add_foreign_key "ip_livestock_breeds", "research_groups"
  add_foreign_key "ip_livestock_breeds", "subtypes", column: "category_id"
  add_foreign_key "ip_livestock_breeds", "users", column: "created_by"
  add_foreign_key "ip_livestock_breeds", "users", column: "updated_by"
  add_foreign_key "journals", "users", column: "created_by"
  add_foreign_key "journals", "users", column: "updated_by"
  add_foreign_key "knwl_spec_areas", "users", column: "created_by"
  add_foreign_key "knwl_spec_areas", "users", column: "updated_by"
  add_foreign_key "new_animal_breeds", "colciencias_calls"
  add_foreign_key "new_animal_breeds", "geo_cities"
  add_foreign_key "new_animal_breeds", "research_groups"
  add_foreign_key "new_animal_breeds", "subtypes", column: "category_id"
  add_foreign_key "new_animal_breeds", "subtypes", column: "cycle_type_id"
  add_foreign_key "new_animal_breeds", "subtypes", column: "petition_status_id"
  add_foreign_key "new_animal_breeds", "users", column: "created_by"
  add_foreign_key "new_animal_breeds", "users", column: "updated_by"
  add_foreign_key "new_scientific_records", "colciencias_calls"
  add_foreign_key "new_scientific_records", "geo_cities"
  add_foreign_key "new_scientific_records", "research_groups"
  add_foreign_key "new_scientific_records", "subtypes", column: "category_id"
  add_foreign_key "new_scientific_records", "users", column: "created_by"
  add_foreign_key "new_scientific_records", "users", column: "updated_by"
  add_foreign_key "oecd_disciplines", "oecd_knowledge_subareas"
  add_foreign_key "oecd_disciplines", "users", column: "created_by"
  add_foreign_key "oecd_disciplines", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_subareas", "oecd_knowledge_areas"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "updated_by"
  add_foreign_key "paper_types", "users", column: "created_by"
  add_foreign_key "paper_types", "users", column: "updated_by"
  add_foreign_key "papers", "colciencias_calls"
  add_foreign_key "papers", "geo_cities"
  add_foreign_key "papers", "journals"
  add_foreign_key "papers", "research_groups"
  add_foreign_key "papers", "subtypes", column: "category_id"
  add_foreign_key "papers", "subtypes", column: "paper_type_id"
  add_foreign_key "papers", "users", column: "created_by"
  add_foreign_key "papers", "users", column: "updated_by"
  add_foreign_key "participant_types", "users", column: "created_by"
  add_foreign_key "participant_types", "users", column: "updated_by"
  add_foreign_key "patent_states", "users", column: "created_by"
  add_foreign_key "patent_states", "users", column: "updated_by"
  add_foreign_key "patents", "colciencias_calls"
  add_foreign_key "patents", "research_groups"
  add_foreign_key "patents", "subtypes", column: "category_id"
  add_foreign_key "patents", "subtypes", column: "patent_state_id"
  add_foreign_key "patents", "users", column: "created_by"
  add_foreign_key "patents", "users", column: "updated_by"
  add_foreign_key "petition_statuses", "users", column: "created_by"
  add_foreign_key "petition_statuses", "users", column: "updated_by"
  add_foreign_key "plant_ind_prototypes", "colciencias_calls"
  add_foreign_key "plant_ind_prototypes", "geo_cities"
  add_foreign_key "plant_ind_prototypes", "research_groups"
  add_foreign_key "plant_ind_prototypes", "subtypes", column: "category_id"
  add_foreign_key "plant_ind_prototypes", "subtypes", column: "plt_type_id"
  add_foreign_key "plant_ind_prototypes", "users", column: "created_by"
  add_foreign_key "plant_ind_prototypes", "users", column: "updated_by"
  add_foreign_key "research_creation_works", "colciencias_calls"
  add_foreign_key "research_creation_works", "geo_cities"
  add_foreign_key "research_creation_works", "research_groups"
  add_foreign_key "research_creation_works", "subtypes", column: "category_id"
  add_foreign_key "research_creation_works", "subtypes", column: "knwl_spec_area_id"
  add_foreign_key "research_creation_works", "users", column: "created_by"
  add_foreign_key "research_creation_works", "users", column: "updated_by"
  add_foreign_key "research_groups", "cine_broad_areas"
  add_foreign_key "research_groups", "cine_specific_areas"
  add_foreign_key "research_groups", "oecd_knowledge_areas"
  add_foreign_key "research_groups", "oecd_knowledge_subareas"
  add_foreign_key "research_groups", "subtypes", column: "group_state_id"
  add_foreign_key "research_groups", "subtypes", column: "group_type_id"
  add_foreign_key "research_groups", "users", column: "created_by"
  add_foreign_key "research_groups", "users", column: "updated_by"
  add_foreign_key "researchers", "users", column: "created_by"
  add_foreign_key "researchers", "users", column: "updated_by"
  add_foreign_key "roles", "users", column: "created_by"
  add_foreign_key "roles", "users", column: "updated_by"
  add_foreign_key "scientific_notes", "colciencias_calls"
  add_foreign_key "scientific_notes", "geo_cities"
  add_foreign_key "scientific_notes", "journals"
  add_foreign_key "scientific_notes", "research_groups"
  add_foreign_key "scientific_notes", "subtypes", column: "category_id"
  add_foreign_key "scientific_notes", "users", column: "created_by"
  add_foreign_key "scientific_notes", "users", column: "updated_by"
  add_foreign_key "software", "colciencias_calls"
  add_foreign_key "software", "geo_cities"
  add_foreign_key "software", "research_groups"
  add_foreign_key "software", "subtypes", column: "category_id"
  add_foreign_key "software", "users", column: "created_by"
  add_foreign_key "software", "users", column: "updated_by"
  add_foreign_key "subtypes", "subtypes", column: "parent_id"
  add_foreign_key "subtypes", "types"
  add_foreign_key "subtypes", "users", column: "created_by"
  add_foreign_key "subtypes", "users", column: "updated_by"
  add_foreign_key "types", "users", column: "created_by"
  add_foreign_key "types", "users", column: "updated_by"
  add_foreign_key "user_roles", "users", column: "created_by"
  add_foreign_key "user_roles", "users", column: "updated_by"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "users", column: "created_by"
  add_foreign_key "users", "users", column: "updated_by"
  add_foreign_key "vegetable_varieties", "colciencias_calls"
  add_foreign_key "vegetable_varieties", "geo_cities"
  add_foreign_key "vegetable_varieties", "research_groups"
  add_foreign_key "vegetable_varieties", "subtypes", column: "category_id"
  add_foreign_key "vegetable_varieties", "subtypes", column: "cycle_type_id"
  add_foreign_key "vegetable_varieties", "subtypes", column: "petition_status_id"
  add_foreign_key "vegetable_varieties", "users", column: "created_by"
  add_foreign_key "vegetable_varieties", "users", column: "updated_by"
  add_foreign_key "work_types", "users", column: "created_by"
  add_foreign_key "work_types", "users", column: "updated_by"

  create_view "complete_users", sql_definition: <<-SQL
      SELECT u.id,
      u.identification_number,
      u.oas_user_id,
      u.user_role_id,
      ur.name AS user_role_name,
      u.active,
      u.created_by,
      u.updated_by,
      u.created_at,
      u.updated_at
     FROM (users u
       LEFT JOIN user_roles ur ON ((u.user_role_id = ur.id)));
  SQL
  create_view "complete_books", sql_definition: <<-SQL
      SELECT b.id,
      b.title,
      b.category_id,
      st.st_name AS category_name,
      b.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      b.editorial_id,
      e.name AS editorial_name,
      b.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      b.isbn,
      b.observation,
      b.publication_date,
      b.research_group_id,
      b.url,
      b.active,
      b.created_by,
      b.updated_by,
      b.created_at,
      b.updated_at
     FROM ((((((books b
       LEFT JOIN subtypes st ON ((b.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((b.colciencias_call_id = cc.id)))
       LEFT JOIN editorials e ON ((b.editorial_id = e.id)))
       LEFT JOIN geo_cities gcity ON ((b.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_book_chapters", sql_definition: <<-SQL
      SELECT bc.id,
      bc.book_title,
      bc.title,
      bc.category_id,
      st.st_name AS category_name,
      bc.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      bc.doi,
      bc.editorial_id,
      e.name AS editorial_name,
      bc.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      bc.isbn,
      bc.observation,
      bc.publication_date,
      bc.research_group_id,
      bc.url,
      bc.active,
      bc.created_by,
      bc.updated_by,
      bc.created_at,
      bc.updated_at
     FROM ((((((book_chapters bc
       LEFT JOIN subtypes st ON ((bc.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((bc.colciencias_call_id = cc.id)))
       LEFT JOIN editorials e ON ((bc.editorial_id = e.id)))
       LEFT JOIN geo_cities gcity ON ((bc.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_papers", sql_definition: <<-SQL
      SELECT p.id,
      p.title,
      p.approval_date,
      p.category_id,
      stc.st_name AS category_name,
      p.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      p.doi,
      p.final_page,
      p.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      p.initial_page,
      p.issn,
      p.journal_id,
      j.name AS journal_name,
      p.number_of_pages,
      p.observation,
      p.paper_type_id,
      stpt.st_name AS paper_type_name,
      p.publication_date,
      p.research_group_id,
      p.url,
      p.volume,
      p.active,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM (((((((papers p
       LEFT JOIN subtypes stc ON ((p.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((p.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((p.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       LEFT JOIN journals j ON ((p.journal_id = j.id)))
       LEFT JOIN subtypes stpt ON ((p.paper_type_id = stpt.id)));
  SQL
  create_view "complete_scientific_notes", sql_definition: <<-SQL
      SELECT sn.id,
      sn.title,
      sn.approval_date,
      sn.category_id,
      st.st_name AS category_name,
      sn.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      sn.doi,
      sn.final_page,
      sn.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      sn.initial_page,
      sn.issn,
      sn.journal_id,
      j.name AS journal_name,
      sn.number_of_pages,
      sn.observation,
      sn.publication_date,
      sn.research_group_id,
      sn.url,
      sn.volume,
      sn.active,
      sn.created_by,
      sn.updated_by,
      sn.created_at,
      sn.updated_at
     FROM ((((((scientific_notes sn
       LEFT JOIN subtypes st ON ((sn.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((sn.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((sn.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       LEFT JOIN journals j ON ((sn.journal_id = j.id)));
  SQL
  create_view "complete_patents", sql_definition: <<-SQL
      SELECT p.id,
      p.title,
      p.category_id,
      stc.st_name AS category_name,
      p.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      p.date_of_obtaining,
      ARRAY( SELECT gcp.geo_country_id
             FROM geo_countries_patents gcp
            WHERE (p.id = gcp.patent_id)) AS geo_country_ids,
      p.industrial_publication_gazette,
      p.observation,
      p.patent_state_id,
      stps.st_name AS patent_state_name,
      p.patent_number,
      p.research_group_id,
      p.active,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM (((patents p
       LEFT JOIN subtypes stc ON ((p.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((p.colciencias_call_id = cc.id)))
       LEFT JOIN subtypes stps ON ((p.patent_state_id = stps.id)));
  SQL
  create_view "complete_vegetable_varieties", sql_definition: <<-SQL
      SELECT vv.id,
      vv.name,
      vv.category_id,
      stc.st_name AS category_name,
      vv.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      vv.cycle_type_id,
      stcc.st_name AS cycle_type_name,
      vv.date,
      vv.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      vv.petition_status_id,
      stpt.st_name AS petition_status_name,
      vv.observation,
      vv.research_group_id,
      vv.active,
      vv.created_by,
      vv.updated_by,
      vv.created_at,
      vv.updated_at
     FROM (((((((vegetable_varieties vv
       LEFT JOIN subtypes stc ON ((vv.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((vv.colciencias_call_id = cc.id)))
       LEFT JOIN subtypes stcc ON ((vv.cycle_type_id = stcc.id)))
       LEFT JOIN geo_cities gcity ON ((vv.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stpt ON ((vv.petition_status_id = stpt.id)));
  SQL
  create_view "complete_new_animal_bs", sql_definition: <<-SQL
      SELECT nab.id,
      nab.name,
      nab.category_id,
      stc.st_name AS category_name,
      nab.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      nab.cycle_type_id,
      stcc.st_name AS cycle_type_name,
      nab.date,
      nab.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      nab.petition_status_id,
      stpt.st_name AS petition_status_name,
      nab.observation,
      nab.research_group_id,
      nab.active,
      nab.created_by,
      nab.updated_by,
      nab.created_at,
      nab.updated_at
     FROM (((((((new_animal_breeds nab
       LEFT JOIN subtypes stc ON ((nab.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((nab.colciencias_call_id = cc.id)))
       LEFT JOIN subtypes stcc ON ((nab.cycle_type_id = stcc.id)))
       LEFT JOIN geo_cities gcity ON ((nab.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stpt ON ((nab.petition_status_id = stpt.id)));
  SQL
  create_view "complete_ipl_breeds", sql_definition: <<-SQL
      SELECT iplb.id,
      iplb.name,
      iplb.category_id,
      stc.st_name AS category_name,
      iplb.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      iplb.consecutive_number_ma,
      iplb.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      iplb.observation,
      iplb.publication_date,
      iplb.research_group_id,
      iplb.active,
      iplb.created_by,
      iplb.updated_by,
      iplb.created_at,
      iplb.updated_at
     FROM (((((ip_livestock_breeds iplb
       LEFT JOIN subtypes stc ON ((iplb.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((iplb.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((iplb.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_research_cws", sql_definition: <<-SQL
      SELECT rcw.id,
      rcw.title,
      rcw.category_id,
      stc.st_name AS category_name,
      rcw.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      rcw.creation_and_selection_date,
      rcw.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      rcw.knwl_spec_area_id,
      stksa.st_name AS knwl_spec_area_name,
      rcw.nature_of_work,
      rcw.observation,
      rcw.registered_project_title,
      rcw.url,
      ARRAY( SELECT rcwwt.subtype_id
             FROM research_creation_works_work_types rcwwt
            WHERE (rcw.id = rcwwt.research_creation_work_id)) AS work_type_ids,
      rcw.research_group_id,
      rcw.active,
      rcw.created_by,
      rcw.updated_by,
      rcw.created_at,
      rcw.updated_at
     FROM ((((((research_creation_works rcw
       LEFT JOIN subtypes stc ON ((rcw.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((rcw.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((rcw.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stksa ON ((rcw.knwl_spec_area_id = stksa.id)));
  SQL
  create_view "research_units_by_researchers", sql_definition: <<-SQL
      SELECT rs.id,
      rs.identification_number,
      rs.oas_researcher_id,
      rs.active AS researcher_is_active,
      gm.id AS group_member_id,
      gm.role_id,
      rl.name AS role_name,
      gm.gm_state_id,
      gm.active AS group_member_is_active,
      gm.research_group_id,
      rg.name AS research_group_name,
      rg.acronym,
      rg.group_type_id,
      rg.group_state_id,
      rg.legacy_siciud_id
     FROM (((researchers rs
       JOIN group_members gm ON ((gm.researcher_id = rs.id)))
       JOIN roles rl ON ((rl.id = gm.role_id)))
       JOIN research_groups rg ON ((gm.research_group_id = rg.id)));
  SQL
  create_view "complete_types", sql_definition: <<-SQL
      SELECT st.type_id,
      t.t_name AS type_name,
      t.t_description AS type_description,
      t.active AS type_active,
      st.parent_id,
      p.st_name AS parent_name,
      p.st_description AS parent_description,
      p.type_id AS parent_type_id,
      pt.t_name AS parent_type_name,
      pt.active AS parent_type_active,
      st.id,
      st.st_name AS name,
      st.st_description AS description,
      st.active
     FROM (((types t
       RIGHT JOIN subtypes st ON ((t.id = st.type_id)))
       LEFT JOIN subtypes p ON ((st.parent_id = p.id)))
       LEFT JOIN types pt ON ((p.type_id = pt.id)));
  SQL
  create_view "complete_int_participants", sql_definition: <<-SQL
      SELECT intp.id,
      intp.producible_type AS product_type,
      intp.producible_id AS product_type_id,
      intp.researcher_id,
      r.oas_researcher_id,
      intp.participant_type_id,
      pt.st_name AS participant_type_name,
      intp.active,
      intp.created_by,
      intp.updated_by,
      intp.created_at,
      intp.updated_at
     FROM ((int_participants intp
       LEFT JOIN researchers r ON ((r.id = intp.researcher_id)))
       LEFT JOIN subtypes pt ON ((pt.id = intp.participant_type_id)));
  SQL
  create_view "complete_ext_participants", sql_definition: <<-SQL
      SELECT extp.id,
      extp.producible_type AS product_type,
      extp.producible_id AS product_type_id,
      extp.first_name,
      extp.last_name,
      extp.participant_type_id,
      pt.st_name AS participant_type_name,
      extp.active,
      extp.created_by,
      extp.updated_by,
      extp.created_at,
      extp.updated_at
     FROM (ext_participants extp
       LEFT JOIN subtypes pt ON ((pt.id = extp.participant_type_id)));
  SQL
  create_view "complete_documents", sql_definition: <<-SQL
      SELECT doc.id,
      doc.nuxeo_id,
      doc.documentable_type AS product_type,
      doc.documentable_id AS product_type_id,
      doc.doc_name,
      doc.doc_path,
      doc.doc_size,
      doc.document_type_id,
      dt.st_name AS document_type_name,
      doc.active,
      doc.created_by,
      doc.updated_by,
      doc.created_at,
      doc.updated_at
     FROM (documents doc
       LEFT JOIN subtypes dt ON ((dt.id = doc.document_type_id)));
  SQL
  create_view "complete_events", sql_definition: <<-SQL
      SELECT eve.id,
      eve.category_id,
      st.st_name AS category_name,
      eve.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      eve.eve_name,
      eve.eve_start_date,
      eve.eve_finish_date,
      eve.eve_organizers,
      eve.eve_entities,
      eve.eve_observation,
      eve.eve_type_id,
      evt.st_name AS eve_type_name,
      eve.research_group_id,
      eve.active,
      eve.created_by,
      eve.updated_by,
      eve.created_at,
      eve.updated_at
     FROM (((events eve
       LEFT JOIN subtypes st ON ((eve.category_id = st.id)))
       LEFT JOIN subtypes evt ON ((eve.eve_type_id = evt.id)))
       LEFT JOIN colciencias_calls cc ON ((eve.colciencias_call_id = cc.id)));
  SQL
  create_view "complete_degree_works", sql_definition: <<-SQL
      SELECT dw.id,
      dw.category_id,
      st.st_name AS category_name,
      dw.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      dw.dw_title,
      dw.dw_date,
      dw.dw_institution_name,
      dw.dw_recognition,
      dw.dw_type_id,
      dwt.st_name AS dw_type_name,
      dw.dw_observation,
      dw.research_group_id,
      dw.active,
      dw.created_by,
      dw.updated_by,
      dw.created_at,
      dw.updated_at
     FROM (((degree_works dw
       LEFT JOIN subtypes st ON ((dw.category_id = st.id)))
       LEFT JOIN subtypes dwt ON ((dw.category_id = dwt.id)))
       LEFT JOIN colciencias_calls cc ON ((dw.colciencias_call_id = cc.id)));
  SQL
  create_view "research_units", sql_definition: <<-SQL
      SELECT rg.id,
      rg.legacy_siciud_id,
      rg.name,
      rg.acronym,
      rg.description,
      rg.cidc_registration_date,
      rg.cidc_act_number,
      rg.faculty_act_number,
      rg.faculty_registration_date,
      rg.email,
      rg.gruplac,
      rg.webpage,
      rg.mission,
      rg.vision,
      rg.colciencias_code,
      rg.snies_id,
      rg.group_type_id,
      stgt.st_name AS group_type_name,
      rg.group_state_id,
      stgs.st_name AS group_state_name,
      rg.interinstitutional,
      ARRAY( SELECT group_members.researcher_id
             FROM group_members
            WHERE (group_members.research_group_id = rg.id)) AS member_ids,
      ( SELECT count(*) AS count
             FROM group_members
            WHERE (group_members.research_group_id = rg.id)) AS member_count,
      ARRAY( SELECT faculty_ids_research_groups.faculty_id
             FROM faculty_ids_research_groups
            WHERE (faculty_ids_research_groups.research_group_id = rg.id)) AS faculty_ids,
      rg.cine_broad_area_id,
      ( SELECT cine_broad_areas.name
             FROM cine_broad_areas
            WHERE (cine_broad_areas.id = rg.cine_broad_area_id)) AS cine_broad_area_name,
      rg.cine_specific_area_id,
      ( SELECT cine_specific_areas.name
             FROM cine_specific_areas
            WHERE (cine_specific_areas.id = rg.cine_specific_area_id)) AS cine_specific_area_name,
      ARRAY( SELECT cine_detailed_areas_research_groups.cine_detailed_area_id
             FROM cine_detailed_areas_research_groups
            WHERE (cine_detailed_areas_research_groups.research_group_id = rg.id)) AS cine_detailed_area_ids,
      ARRAY( SELECT curricular_prj_ids_research_groups.curricular_project_id
             FROM curricular_prj_ids_research_groups
            WHERE (curricular_prj_ids_research_groups.research_group_id = rg.id)) AS curricular_project_ids,
      rg.oecd_knowledge_area_id,
      ( SELECT oecd_knowledge_areas.name
             FROM oecd_knowledge_areas
            WHERE (oecd_knowledge_areas.id = rg.oecd_knowledge_area_id)) AS oecd_knowledge_area_name,
      rg.oecd_knowledge_subarea_id,
      ( SELECT oecd_knowledge_subareas.name
             FROM oecd_knowledge_subareas
            WHERE (oecd_knowledge_subareas.id = rg.oecd_knowledge_subarea_id)) AS oecd_knowledge_subarea_name,
      ARRAY( SELECT oecd_disciplines_research_groups.oecd_discipline_id
             FROM oecd_disciplines_research_groups
            WHERE (oecd_disciplines_research_groups.research_group_id = rg.id)) AS oecd_discipline_ids,
      ARRAY( SELECT research_focuses_units.subtype_id
             FROM research_focuses_units
            WHERE (research_focuses_units.research_group_id = rg.id)) AS research_focus_ids,
      rg.created_at,
      rg.updated_at,
      rg.created_by,
      rg.updated_by
     FROM ((research_groups rg
       LEFT JOIN subtypes stgt ON ((rg.group_type_id = stgt.id)))
       LEFT JOIN subtypes stgs ON ((rg.group_state_id = stgs.id)));
  SQL
  create_view "complete_industrial_designs", sql_definition: <<-SQL
      SELECT ind.id,
      ind.category_id,
      st.st_name AS category_name,
      ind.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ind.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      ind.ind_dsg_date_of_obtaining,
      ind.ind_dsg_industrial_publication_gazette,
      ind.ind_dsg_registration_number,
      ind.ind_dsg_registration_title,
      ind.observation,
      ind.research_group_id,
      ind.active,
      ind.created_by,
      ind.updated_by,
      ind.created_at,
      ind.updated_at
     FROM (((((industrial_designs ind
       LEFT JOIN subtypes st ON ((ind.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ind.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ind.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_icds", sql_definition: <<-SQL
      SELECT icd.id,
      icd.category_id,
      st.st_name AS category_name,
      icd.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      icd.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      icd.icd_date_of_obtaining,
      icd.icd_registration_number,
      icd.icd_registration_title,
      icd.observation,
      icd.research_group_id,
      icd.active,
      icd.created_by,
      icd.updated_by,
      icd.created_at,
      icd.updated_at
     FROM (((((integrated_circuit_diagrams icd
       LEFT JOIN subtypes st ON ((icd.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((icd.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((icd.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_software", sql_definition: <<-SQL
      SELECT soft.id,
      soft.category_id,
      st.st_name AS category_name,
      soft.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      soft.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      soft.sof_date_of_obtaining,
      soft.sof_description,
      soft.sof_product_title,
      soft.sof_registration_number,
      soft.observation,
      soft.research_group_id,
      soft.active,
      soft.created_by,
      soft.updated_by,
      soft.created_at,
      soft.updated_at
     FROM (((((software soft
       LEFT JOIN subtypes st ON ((soft.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((soft.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((soft.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_plt_ind_prots", sql_definition: <<-SQL
      SELECT pltind.id,
      pltind.category_id,
      st.st_name AS category_name,
      pltind.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      pltind.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      pltind.institution_name,
      pltind.plt_name,
      pltind.plt_date_of_elaboration,
      pltind.plt_registration_number,
      pltind.plt_type_id,
      stplt.st_name AS plt_type_name,
      pltind.observation,
      pltind.research_group_id,
      pltind.active,
      pltind.created_by,
      pltind.updated_by,
      pltind.created_at,
      pltind.updated_at
     FROM ((((((plant_ind_prototypes pltind
       LEFT JOIN subtypes st ON ((pltind.category_id = st.id)))
       LEFT JOIN subtypes stplt ON ((pltind.plt_type_id = stplt.id)))
       LEFT JOIN colciencias_calls cc ON ((pltind.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((pltind.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_new_scientific_records", sql_definition: <<-SQL
      SELECT nsr.id,
      nsr.category_id,
      st.st_name AS category_name,
      nsr.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      nsr.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      nsr.nsr_name,
      nsr.nsr_date_of_obtaining,
      nsr.nsr_database_name,
      nsr.nsr_database_url,
      nsr.nsr_certifying_institution,
      nsr.nsr_issuing_institution,
      nsr.observation,
      nsr.research_group_id,
      nsr.active,
      nsr.created_by,
      nsr.updated_by,
      nsr.created_at,
      nsr.updated_at
     FROM (((((new_scientific_records nsr
       LEFT JOIN subtypes st ON ((nsr.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((nsr.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((nsr.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
end
