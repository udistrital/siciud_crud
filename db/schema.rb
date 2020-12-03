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

ActiveRecord::Schema.define(version: 2020_12_03_222747) do

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
    t.bigint "product_typology_id"
    t.bigint "agreement_research_project_id"
    t.integer "completedPercentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agreement_research_project_id"], name: "index_arp_assignments_on_agreement_research_project_id"
    t.index ["product_typology_id"], name: "index_arp_assignments_on_product_typology_id"
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
    t.boolean "active"
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
    t.bigint "category_id"
    t.bigint "editorial_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "book_chapter_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_book_chapters_on_category_id"
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
    t.bigint "category_id"
    t.bigint "editorial_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.string "book_document"
    t.index ["category_id"], name: "index_books_on_category_id"
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
    t.bigint "product_type_id"
    t.text "alternate_indicator"
    t.bigint "required_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_calls_product_types_on_call_id"
    t.index ["product_type_id"], name: "index_calls_product_types_on_product_type_id"
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

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "product_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_categories_on_created_by"
    t.index ["product_type_id"], name: "index_categories_on_product_type_id"
    t.index ["updated_by"], name: "index_categories_on_updated_by"
  end

  create_table "cine_broad_areas", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
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
    t.boolean "active"
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
    t.boolean "active"
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
  end

  create_table "colciencias_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_group_id"], name: "index_curricular_prj_ids_research_groups_on_research_group_id"
  end

  create_table "cycle_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "ext_participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "producible_type"
    t.bigint "producible_id"
    t.bigint "participant_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_type_id"], name: "index_ext_participants_on_participant_type_id"
    t.index ["producible_type", "producible_id"], name: "index_ext_participants_on_producible_type_and_producible_id"
  end

  create_table "faculty_ids_research_groups", force: :cascade do |t|
    t.bigint "research_group_id"
    t.integer "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_group_id"], name: "index_faculty_ids_research_groups_on_research_group_id"
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
    t.index ["geo_state_id"], name: "index_geo_cities_on_geo_state_id"
  end

  create_table "geo_countries", force: :cascade do |t|
    t.string "name"
    t.string "iso2", limit: 2
    t.string "iso3", limit: 3
    t.string "capital_name", limit: 255
    t.string "currency", limit: 10
  end

  create_table "geo_countries_patents", id: false, force: :cascade do |t|
    t.bigint "geo_country_id", null: false
    t.bigint "patent_id", null: false
  end

  create_table "geo_states", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 10
    t.bigint "geo_country_id"
    t.index ["geo_country_id"], name: "index_geo_states_on_geo_country_id"
  end

  create_table "gm_periods", force: :cascade do |t|
    t.date "initial_date"
    t.date "final_date"
    t.integer "role_id"
    t.integer "group_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_member_id"], name: "index_gm_periods_on_group_member_id"
    t.index ["role_id"], name: "index_gm_periods_on_role_id"
  end

  create_table "gm_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "role_id"
    t.integer "researcher_id"
    t.integer "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gm_state_id"
    t.index ["gm_state_id"], name: "index_group_members_on_gm_state_id"
    t.index ["research_group_id"], name: "index_group_members_on_research_group_id"
    t.index ["researcher_id"], name: "index_group_members_on_researcher_id"
    t.index ["role_id"], name: "index_group_members_on_role_id"
  end

  create_table "group_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_colciencias_ranks", force: :cascade do |t|
    t.integer "colciencias_call_id"
    t.integer "colciencias_category_id"
    t.integer "research_group_id"
    t.string "knowledge_area"
    t.string "knowledge_subarea"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colciencias_call_id"], name: "index_historical_colciencias_ranks_on_colciencias_call_id"
    t.index ["colciencias_category_id"], name: "index_historical_colciencias_ranks_on_colciencias_category_id"
    t.index ["research_group_id"], name: "index_historical_colciencias_ranks_on_research_group_id"
  end

  create_table "int_participants", force: :cascade do |t|
    t.string "producible_type"
    t.bigint "producible_id"
    t.bigint "participant_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "researcher_id"
    t.index ["participant_type_id"], name: "index_int_participants_on_participant_type_id"
    t.index ["producible_type", "producible_id"], name: "index_int_participants_on_producible_type_and_producible_id"
    t.index ["researcher_id"], name: "index_int_participants_on_researcher_id"
  end

  create_table "ip_livestock_breeds", force: :cascade do |t|
    t.string "name"
    t.date "publication_date"
    t.string "consecutive_number_ma"
    t.text "observation"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "certificate_ma_document"
    t.string "ip_livestock_breed_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_ip_livestock_breeds_on_category_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_animal_breeds", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "observation"
    t.bigint "cycle_type_id"
    t.bigint "petition_status_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "ccb_ica_document"
    t.string "new_animal_breed_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_new_animal_breeds_on_category_id"
    t.index ["created_by"], name: "index_new_animal_breeds_on_created_by"
    t.index ["cycle_type_id"], name: "index_new_animal_breeds_on_cycle_type_id"
    t.index ["geo_city_id"], name: "index_new_animal_breeds_on_geo_city_id"
    t.index ["petition_status_id"], name: "index_new_animal_breeds_on_petition_status_id"
    t.index ["research_group_id"], name: "index_new_animal_breeds_on_research_group_id"
    t.index ["updated_by"], name: "index_new_animal_breeds_on_updated_by"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "category_id"
    t.bigint "journal_id"
    t.bigint "paper_type_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "paper_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_papers_on_category_id"
    t.index ["created_by"], name: "index_papers_on_created_by"
    t.index ["geo_city_id"], name: "index_papers_on_geo_city_id"
    t.index ["journal_id"], name: "index_papers_on_journal_id"
    t.index ["paper_type_id"], name: "index_papers_on_paper_type_id"
    t.index ["research_group_id"], name: "index_papers_on_research_group_id"
    t.index ["updated_by"], name: "index_papers_on_updated_by"
  end

  create_table "participant_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patent_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patents", force: :cascade do |t|
    t.string "patent_number"
    t.string "title"
    t.date "date_of_obtaining"
    t.string "industrial_publication_gazette"
    t.text "observation"
    t.bigint "category_id"
    t.bigint "patent_state_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "patent_certificate_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_patents_on_category_id"
    t.index ["created_by"], name: "index_patents_on_created_by"
    t.index ["patent_state_id"], name: "index_patents_on_patent_state_id"
    t.index ["research_group_id"], name: "index_patents_on_research_group_id"
    t.index ["updated_by"], name: "index_patents_on_updated_by"
  end

  create_table "petition_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_periods", force: :cascade do |t|
    t.string "description"
    t.integer "planable_id"
    t.string "planable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planable_id"], name: "index_plan_periods_on_planable_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.text "indicator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_typology_id"
    t.index ["product_typology_id"], name: "index_product_types_on_product_typology_id"
  end

  create_table "product_typologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "knwl_spec_area_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "certificate_work_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_research_creation_works_on_category_id"
    t.index ["created_by"], name: "index_research_creation_works_on_created_by"
    t.index ["geo_city_id"], name: "index_research_creation_works_on_geo_city_id"
    t.index ["knwl_spec_area_id"], name: "index_research_creation_works_on_knwl_spec_area_id"
    t.index ["research_group_id"], name: "index_research_creation_works_on_research_group_id"
    t.index ["updated_by"], name: "index_research_creation_works_on_updated_by"
  end

  create_table "research_creation_works_work_types", id: false, force: :cascade do |t|
    t.bigint "work_type_id", null: false
    t.bigint "research_creation_work_id", null: false
  end

  create_table "research_focuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "group_type_id"
    t.bigint "group_state_id"
    t.boolean "interinstitutional"
    t.bigint "cine_broad_area_id"
    t.bigint "cine_specific_area_id"
    t.bigint "oecd_knowledge_subarea_id"
    t.bigint "oecd_knowledge_area_id"
    t.integer "legacy_siciud_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.string "cidc_act_document"
    t.string "establishment_document"
    t.string "faculty_act_document"
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
    t.boolean "active"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scientific_notes", force: :cascade do |t|
    t.string "title"
    t.string "journal_title"
    t.date "publication_date"
    t.string "volume"
    t.integer "number_of_pages"
    t.integer "initial_page"
    t.integer "final_page"
    t.string "issn"
    t.string "url"
    t.string "doi"
    t.text "observation"
    t.bigint "category_id"
    t.bigint "journal_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.date "approval_date"
    t.string "scientific_note_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_scientific_notes_on_category_id"
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

  create_table "state_seedbeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identification_number"
    t.string "oas_user_id"
    t.bigint "user_role_id"
    t.boolean "active"
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
    t.bigint "cycle_type_id"
    t.bigint "petition_status_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_city_id"
    t.string "vegetable_variety_document"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["category_id"], name: "index_vegetable_varieties_on_category_id"
    t.index ["created_by"], name: "index_vegetable_varieties_on_created_by"
    t.index ["cycle_type_id"], name: "index_vegetable_varieties_on_cycle_type_id"
    t.index ["geo_city_id"], name: "index_vegetable_varieties_on_geo_city_id"
    t.index ["petition_status_id"], name: "index_vegetable_varieties_on_petition_status_id"
    t.index ["research_group_id"], name: "index_vegetable_varieties_on_research_group_id"
    t.index ["updated_by"], name: "index_vegetable_varieties_on_updated_by"
  end

  create_table "work_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "arp_assignment_reports", "arp_assignments"
  add_foreign_key "arp_assignments", "agreement_research_projects"
  add_foreign_key "arp_assignments", "product_typologies"
  add_foreign_key "awards", "research_creation_works"
  add_foreign_key "awards", "users", column: "created_by"
  add_foreign_key "awards", "users", column: "updated_by"
  add_foreign_key "book_chapters", "categories"
  add_foreign_key "book_chapters", "editorials"
  add_foreign_key "book_chapters", "geo_cities"
  add_foreign_key "book_chapters", "research_groups"
  add_foreign_key "book_chapters", "users", column: "created_by"
  add_foreign_key "book_chapters", "users", column: "updated_by"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "editorials"
  add_foreign_key "books", "geo_cities"
  add_foreign_key "books", "research_groups"
  add_foreign_key "books", "users", column: "created_by"
  add_foreign_key "books", "users", column: "updated_by"
  add_foreign_key "call_item_categories", "calls"
  add_foreign_key "call_item_categories", "item_categories"
  add_foreign_key "calls", "call_types"
  add_foreign_key "calls", "call_user_roles"
  add_foreign_key "calls", "duration_types"
  add_foreign_key "calls_product_types", "calls"
  add_foreign_key "calls_product_types", "product_types"
  add_foreign_key "calls_product_types", "required_types"
  add_foreign_key "calls_required_documents", "calls"
  add_foreign_key "calls_required_documents", "required_documents"
  add_foreign_key "categories", "product_types"
  add_foreign_key "categories", "users", column: "created_by"
  add_foreign_key "categories", "users", column: "updated_by"
  add_foreign_key "cine_broad_areas", "users", column: "created_by"
  add_foreign_key "cine_broad_areas", "users", column: "updated_by"
  add_foreign_key "cine_detailed_areas", "cine_specific_areas"
  add_foreign_key "cine_detailed_areas", "users", column: "created_by"
  add_foreign_key "cine_detailed_areas", "users", column: "updated_by"
  add_foreign_key "cine_specific_areas", "cine_broad_areas"
  add_foreign_key "cine_specific_areas", "users", column: "created_by"
  add_foreign_key "cine_specific_areas", "users", column: "updated_by"
  add_foreign_key "curricular_prj_ids_research_groups", "research_groups"
  add_foreign_key "editorials", "users", column: "created_by"
  add_foreign_key "editorials", "users", column: "updated_by"
  add_foreign_key "ext_participants", "participant_types"
  add_foreign_key "faculty_ids_research_groups", "research_groups"
  add_foreign_key "geo_cities", "geo_states"
  add_foreign_key "geo_states", "geo_countries"
  add_foreign_key "group_members", "gm_states"
  add_foreign_key "int_participants", "participant_types"
  add_foreign_key "int_participants", "researchers"
  add_foreign_key "ip_livestock_breeds", "categories"
  add_foreign_key "ip_livestock_breeds", "geo_cities"
  add_foreign_key "ip_livestock_breeds", "research_groups"
  add_foreign_key "ip_livestock_breeds", "users", column: "created_by"
  add_foreign_key "ip_livestock_breeds", "users", column: "updated_by"
  add_foreign_key "journals", "users", column: "created_by"
  add_foreign_key "journals", "users", column: "updated_by"
  add_foreign_key "new_animal_breeds", "categories"
  add_foreign_key "new_animal_breeds", "cycle_types"
  add_foreign_key "new_animal_breeds", "geo_cities"
  add_foreign_key "new_animal_breeds", "petition_statuses"
  add_foreign_key "new_animal_breeds", "research_groups"
  add_foreign_key "new_animal_breeds", "users", column: "created_by"
  add_foreign_key "new_animal_breeds", "users", column: "updated_by"
  add_foreign_key "oecd_disciplines", "oecd_knowledge_subareas"
  add_foreign_key "oecd_disciplines", "users", column: "created_by"
  add_foreign_key "oecd_disciplines", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_subareas", "oecd_knowledge_areas"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "updated_by"
  add_foreign_key "papers", "categories"
  add_foreign_key "papers", "geo_cities"
  add_foreign_key "papers", "journals"
  add_foreign_key "papers", "paper_types"
  add_foreign_key "papers", "research_groups"
  add_foreign_key "papers", "users", column: "created_by"
  add_foreign_key "papers", "users", column: "updated_by"
  add_foreign_key "patents", "categories"
  add_foreign_key "patents", "patent_states"
  add_foreign_key "patents", "research_groups"
  add_foreign_key "patents", "users", column: "created_by"
  add_foreign_key "patents", "users", column: "updated_by"
  add_foreign_key "product_types", "product_typologies"
  add_foreign_key "research_creation_works", "categories"
  add_foreign_key "research_creation_works", "geo_cities"
  add_foreign_key "research_creation_works", "knwl_spec_areas"
  add_foreign_key "research_creation_works", "research_groups"
  add_foreign_key "research_creation_works", "users", column: "created_by"
  add_foreign_key "research_creation_works", "users", column: "updated_by"
  add_foreign_key "research_groups", "cine_broad_areas"
  add_foreign_key "research_groups", "cine_specific_areas"
  add_foreign_key "research_groups", "group_states"
  add_foreign_key "research_groups", "group_types"
  add_foreign_key "research_groups", "oecd_knowledge_areas"
  add_foreign_key "research_groups", "oecd_knowledge_subareas"
  add_foreign_key "research_groups", "users", column: "created_by"
  add_foreign_key "research_groups", "users", column: "updated_by"
  add_foreign_key "researchers", "users", column: "created_by"
  add_foreign_key "researchers", "users", column: "updated_by"
  add_foreign_key "scientific_notes", "categories"
  add_foreign_key "scientific_notes", "geo_cities"
  add_foreign_key "scientific_notes", "journals"
  add_foreign_key "scientific_notes", "research_groups"
  add_foreign_key "scientific_notes", "users", column: "created_by"
  add_foreign_key "scientific_notes", "users", column: "updated_by"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "users", column: "created_by"
  add_foreign_key "users", "users", column: "updated_by"
  add_foreign_key "vegetable_varieties", "categories"
  add_foreign_key "vegetable_varieties", "cycle_types"
  add_foreign_key "vegetable_varieties", "geo_cities"
  add_foreign_key "vegetable_varieties", "petition_statuses"
  add_foreign_key "vegetable_varieties", "research_groups"
  add_foreign_key "vegetable_varieties", "users", column: "created_by"
  add_foreign_key "vegetable_varieties", "users", column: "updated_by"

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
      ( SELECT group_types.name
             FROM group_types
            WHERE (group_types.id = rg.group_type_id)) AS group_type_name,
      rg.group_state_id,
      ( SELECT group_states.name
             FROM group_states
            WHERE (group_states.id = rg.group_state_id)) AS group_state_name,
      rg.interinstitutional,
      ARRAY( SELECT group_members.researcher_id
             FROM group_members
            WHERE (group_members.research_group_id = rg.id)) AS member_ids,
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
      ARRAY( SELECT research_focuses_groups.research_focus_id
             FROM research_focuses_groups
            WHERE (research_focuses_groups.research_group_id = rg.id)) AS research_focus_ids,
      rg.cidc_act_document,
      rg.establishment_document,
      rg.faculty_act_document,
      rg.created_at,
      rg.updated_at,
      rg.created_by,
      rg.updated_by
     FROM research_groups rg;
  SQL
  create_view "complete_books", sql_definition: <<-SQL
      SELECT b.id,
      b.title,
      b.book_document,
      b.category_id,
      c.name AS category_name,
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
     FROM (((((books b
       JOIN categories c ON ((b.category_id = c.id)))
       JOIN editorials e ON ((b.editorial_id = e.id)))
       JOIN geo_cities gcity ON ((b.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_book_chapters", sql_definition: <<-SQL
      SELECT bc.id,
      bc.book_title,
      bc.title,
      bc.book_chapter_document,
      bc.category_id,
      c.name AS category_name,
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
     FROM (((((book_chapters bc
       JOIN categories c ON ((bc.category_id = c.id)))
       JOIN editorials e ON ((bc.editorial_id = e.id)))
       JOIN geo_cities gcity ON ((bc.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_ipl_breeds", sql_definition: <<-SQL
      SELECT iplb.id,
      iplb.name,
      iplb.category_id,
      c.name AS category_name,
      iplb.certificate_ma_document,
      iplb.consecutive_number_ma,
      iplb.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      iplb.ip_livestock_breed_document,
      iplb.observation,
      iplb.publication_date,
      iplb.research_group_id,
      iplb.active,
      iplb.created_by,
      iplb.updated_by,
      iplb.created_at,
      iplb.updated_at
     FROM ((((ip_livestock_breeds iplb
       JOIN categories c ON ((iplb.category_id = c.id)))
       JOIN geo_cities gcity ON ((iplb.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)));
  SQL
  create_view "complete_new_animal_bs", sql_definition: <<-SQL
      SELECT nab.id,
      nab.name,
      nab.category_id,
      c.name AS category_name,
      nab.ccb_ica_document,
      nab.cycle_type_id,
      ct.name AS cycle_type_name,
      nab.date,
      nab.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      nab.new_animal_breed_document,
      nab.observation,
      nab.petition_status_id,
      ps.name AS petition_status_name,
      nab.research_group_id,
      nab.active,
      nab.created_by,
      nab.updated_by,
      nab.created_at,
      nab.updated_at
     FROM ((((((new_animal_breeds nab
       JOIN categories c ON ((nab.category_id = c.id)))
       JOIN cycle_types ct ON ((nab.cycle_type_id = ct.id)))
       JOIN geo_cities gcity ON ((nab.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       JOIN petition_statuses ps ON ((nab.petition_status_id = ps.id)));
  SQL
  create_view "complete_papers", sql_definition: <<-SQL
      SELECT p.id,
      p.title,
      p.approval_date,
      p.category_id,
      c.name AS category_name,
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
      pt.name AS paper_type_name,
      p.publication_date,
      p.research_group_id,
      p.url,
      p.volume,
      p.active,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM ((((((papers p
       JOIN categories c ON ((p.category_id = c.id)))
       JOIN geo_cities gcity ON ((p.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       JOIN journals j ON ((p.journal_id = j.id)))
       JOIN paper_types pt ON ((p.paper_type_id = pt.id)));
  SQL
  create_view "complete_patents", sql_definition: <<-SQL
      SELECT p.id,
      p.title,
      p.category_id,
      c.name AS category_name,
      p.date_of_obtaining,
      ARRAY( SELECT gcp.geo_country_id
             FROM geo_countries_patents gcp
            WHERE (p.id = gcp.patent_id)) AS geo_country_ids,
      p.industrial_publication_gazette,
      p.observation,
      p.patent_certificate_document,
      p.patent_number,
      p.patent_state_id,
      ps.name AS patent_state_name,
      p.research_group_id,
      p.active,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM ((patents p
       JOIN categories c ON ((p.category_id = c.id)))
       JOIN patent_states ps ON ((p.patent_state_id = ps.id)));
  SQL
  create_view "complete_research_cws", sql_definition: <<-SQL
      SELECT rcw.id,
      rcw.title,
      rcw.category_id,
      c.name AS category_name,
      rcw.creation_and_selection_date,
      rcw.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      rcw.knwl_spec_area_id,
      ksa.name AS knwl_spec_area_name,
      rcw.nature_of_work,
      rcw.observation,
      rcw.registered_project_title,
      rcw.url,
      ARRAY( SELECT rcwwt.work_type_id
             FROM research_creation_works_work_types rcwwt
            WHERE (rcw.id = rcwwt.research_creation_work_id)) AS work_type_ids,
      rcw.research_group_id,
      rcw.active,
      rcw.created_by,
      rcw.updated_by,
      rcw.created_at,
      rcw.updated_at
     FROM (((((research_creation_works rcw
       JOIN categories c ON ((rcw.category_id = c.id)))
       JOIN geo_cities gcity ON ((rcw.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       JOIN knwl_spec_areas ksa ON ((rcw.knwl_spec_area_id = ksa.id)));
  SQL
  create_view "complete_scientific_notes", sql_definition: <<-SQL
      SELECT sn.id,
      sn.title,
      sn.approval_date,
      sn.category_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      sn.initial_page,
      sn.issn,
      sn.journal_id,
      j.name AS journal_name,
      sn.journal_title,
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
     FROM (((((scientific_notes sn
       JOIN categories c ON ((sn.category_id = c.id)))
       JOIN geo_cities gcity ON ((sn.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       JOIN journals j ON ((sn.journal_id = j.id)));
  SQL
  create_view "complete_vegetable_varieties", sql_definition: <<-SQL
      SELECT vv.id,
      vv.name,
      vv.category_id,
      c.name AS category_name,
      vv.cycle_type_id,
      ct.name AS cycle_type_name,
      vv.date,
      vv.geo_city_id,
      gcity.name AS geo_city_name,
      gs.geo_country_id,
      gctry.name AS geo_country_name,
      gcity.geo_state_id,
      gs.name AS geo_state_name,
      vv.observation,
      vv.petition_status_id,
      ps.name AS petition_status_name,
      vv.research_group_id,
      vv.vegetable_variety_document,
      vv.active,
      vv.created_by,
      vv.updated_by,
      vv.created_at,
      vv.updated_at
     FROM ((((((vegetable_varieties vv
       JOIN categories c ON ((vv.category_id = c.id)))
       JOIN cycle_types ct ON ((vv.cycle_type_id = ct.id)))
       JOIN geo_cities gcity ON ((vv.geo_city_id = gcity.id)))
       JOIN geo_states gs ON ((gcity.geo_state_id = gs.id)))
       JOIN geo_countries gctry ON ((gs.geo_country_id = gctry.id)))
       JOIN petition_statuses ps ON ((vv.petition_status_id = ps.id)));
  SQL
end
