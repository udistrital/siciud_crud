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

ActiveRecord::Schema.define(version: 2021_11_21_205428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accompaniment_consultancies", force: :cascade do |t|
    t.string "institution"
    t.string "project_name"
    t.date "date"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_accompaniment_consultancies_on_category_id"
    t.index ["colciencias_call_id"], name: "index_accompaniment_consultancies_on_colciencias_call_id"
    t.index ["created_by"], name: "index_accompaniment_consultancies_on_created_by"
    t.index ["geo_city_id"], name: "index_accompaniment_consultancies_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_accompaniment_consultancies_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_accompaniment_consultancies_on_geo_state_id"
    t.index ["research_group_id"], name: "index_accompaniment_consultancies_on_research_group_id"
    t.index ["updated_by"], name: "index_accompaniment_consultancies_on_updated_by"
  end

  create_table "action_plans", force: :cascade do |t|
    t.integer "execution_validity", limit: 2
    t.boolean "is_draft", default: true
    t.bigint "research_group_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.boolean "management_report_is_draft", default: true
    t.datetime "management_report_published_at"
    t.index ["created_by"], name: "index_action_plans_on_created_by"
    t.index ["research_group_id"], name: "index_action_plans_on_research_group_id"
    t.index ["updated_by"], name: "index_action_plans_on_updated_by"
  end

  create_table "affiliated_entities", force: :cascade do |t|
    t.bigint "research_network_id"
    t.bigint "entity_id"
    t.bigint "institution_type_id"
    t.bigint "geo_country_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_affiliated_entities_on_created_by"
    t.index ["entity_id"], name: "index_affiliated_entities_on_entity_id"
    t.index ["geo_country_id"], name: "index_affiliated_entities_on_geo_country_id"
    t.index ["institution_type_id"], name: "index_affiliated_entities_on_institution_type_id"
    t.index ["research_network_id"], name: "index_affiliated_entities_on_research_network_id"
    t.index ["updated_by"], name: "index_affiliated_entities_on_updated_by"
  end

  create_table "appropriation_processes", force: :cascade do |t|
    t.string "name"
    t.string "research_project_title"
    t.date "start_date"
    t.date "finish_date"
    t.string "funding_institution"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_appropriation_processes_on_category_id"
    t.index ["colciencias_call_id"], name: "index_appropriation_processes_on_colciencias_call_id"
    t.index ["created_by"], name: "index_appropriation_processes_on_created_by"
    t.index ["product_type_id"], name: "index_appropriation_processes_on_product_type_id"
    t.index ["research_group_id"], name: "index_appropriation_processes_on_research_group_id"
    t.index ["updated_by"], name: "index_appropriation_processes_on_updated_by"
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

  create_table "bills", force: :cascade do |t|
    t.string "title"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_bills_on_category_id"
    t.index ["colciencias_call_id"], name: "index_bills_on_colciencias_call_id"
    t.index ["created_by"], name: "index_bills_on_created_by"
    t.index ["research_group_id"], name: "index_bills_on_research_group_id"
    t.index ["updated_by"], name: "index_bills_on_updated_by"
  end

  create_table "book_chapters", force: :cascade do |t|
    t.string "book_title"
    t.string "title"
    t.date "publication_date"
    t.string "isbn"
    t.string "doi"
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
    t.string "editorial_name"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_book_chapters_on_category_id"
    t.index ["colciencias_call_id"], name: "index_book_chapters_on_colciencias_call_id"
    t.index ["created_by"], name: "index_book_chapters_on_created_by"
    t.index ["geo_city_id"], name: "index_book_chapters_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_book_chapters_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_book_chapters_on_geo_state_id"
    t.index ["research_group_id"], name: "index_book_chapters_on_research_group_id"
    t.index ["updated_by"], name: "index_book_chapters_on_updated_by"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.date "publication_date"
    t.string "isbn"
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
    t.bigint "book_type_id"
    t.string "editorial_name"
    t.bigint "geo_country_id"
    t.bigint "geo_state_id"
    t.index ["book_type_id"], name: "index_books_on_book_type_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["colciencias_call_id"], name: "index_books_on_colciencias_call_id"
    t.index ["created_by"], name: "index_books_on_created_by"
    t.index ["geo_city_id"], name: "index_books_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_books_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_books_on_geo_state_id"
    t.index ["research_group_id"], name: "index_books_on_research_group_id"
    t.index ["updated_by"], name: "index_books_on_updated_by"
  end

  create_table "budgets", force: :cascade do |t|
    t.string "description"
    t.string "ally_name"
    t.date "used_date"
    t.bigint "budget_type_id"
    t.bigint "amount"
    t.bigint "task_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_type_id"], name: "index_budgets_on_budget_type_id"
    t.index ["created_by"], name: "index_budgets_on_created_by"
    t.index ["task_id"], name: "index_budgets_on_task_id"
    t.index ["updated_by"], name: "index_budgets_on_updated_by"
  end

  create_table "call_documents", force: :cascade do |t|
    t.bigint "call_id"
    t.bigint "document_id"
    t.boolean "cd_required", default: true
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_call_documents_on_call_id"
    t.index ["created_by"], name: "index_call_documents_on_created_by"
    t.index ["document_id"], name: "index_call_documents_on_document_id"
    t.index ["updated_by"], name: "index_call_documents_on_updated_by"
  end

  create_table "call_eval_criteria", force: :cascade do |t|
    t.bigint "call_id"
    t.bigint "eval_criterion_id"
    t.decimal "cec_percentage", precision: 5, scale: 2
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_call_eval_criteria_on_call_id"
    t.index ["created_by"], name: "index_call_eval_criteria_on_created_by"
    t.index ["eval_criterion_id"], name: "index_call_eval_criteria_on_eval_criterion_id"
    t.index ["updated_by"], name: "index_call_eval_criteria_on_updated_by"
  end

  create_table "call_items", force: :cascade do |t|
    t.bigint "call_id"
    t.bigint "item_id"
    t.decimal "ci_maximum_percentage", precision: 6, scale: 3
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "ci_percentage", precision: 6, scale: 3
    t.index ["call_id"], name: "index_call_items_on_call_id"
    t.index ["created_by"], name: "index_call_items_on_created_by"
    t.index ["item_id"], name: "index_call_items_on_item_id"
    t.index ["updated_by"], name: "index_call_items_on_updated_by"
  end

  create_table "calls", force: :cascade do |t|
    t.text "call_name"
    t.bigint "call_state_id"
    t.string "call_code"
    t.bigint "call_type_id"
    t.bigint "call_beneficiary_id"
    t.integer "call_duration"
    t.date "call_start_date"
    t.date "call_end_date"
    t.float "call_global_budget"
    t.float "call_max_budget_per_project"
    t.text "call_directed_towards"
    t.text "call_objective"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_beneficiary_id"], name: "index_calls_on_call_beneficiary_id"
    t.index ["call_state_id"], name: "index_calls_on_call_state_id"
    t.index ["call_type_id"], name: "index_calls_on_call_type_id"
    t.index ["created_by"], name: "index_calls_on_created_by"
    t.index ["updated_by"], name: "index_calls_on_updated_by"
  end

  create_table "calls_indicators", force: :cascade do |t|
    t.bigint "call_id"
    t.bigint "indicator_id"
    t.boolean "clind_required"
    t.integer "clind_quantity"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_calls_indicators_on_call_id"
    t.index ["created_by"], name: "index_calls_indicators_on_created_by"
    t.index ["indicator_id"], name: "index_calls_indicators_on_indicator_id"
    t.index ["updated_by"], name: "index_calls_indicators_on_updated_by"
  end

  create_table "chapters", force: :cascade do |t|
    t.string "sectionable_type"
    t.bigint "sectionable_id"
    t.bigint "ch_parent_id"
    t.integer "ch_order"
    t.text "ch_title"
    t.text "ch_description"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ch_parent_id"], name: "index_chapters_on_ch_parent_id"
    t.index ["created_by"], name: "index_chapters_on_created_by"
    t.index ["sectionable_type", "sectionable_id"], name: "index_chapters_on_sectionable_type_and_sectionable_id"
    t.index ["updated_by"], name: "index_chapters_on_updated_by"
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

  create_table "cine_detailed_areas_form_d_act_plans", id: false, force: :cascade do |t|
    t.bigint "cine_detailed_area_id", null: false
    t.bigint "form_d_act_plan_id", null: false
  end

  create_table "cine_detailed_areas_research_groups", id: false, force: :cascade do |t|
    t.bigint "research_group_id", null: false
    t.bigint "cine_detailed_area_id", null: false
  end

  create_table "cine_detailed_areas_research_networks", id: false, force: :cascade do |t|
    t.bigint "cine_detailed_area_id", null: false
    t.bigint "research_network_id", null: false
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

  create_table "cine_specific_areas_form_d_act_plans", id: false, force: :cascade do |t|
    t.bigint "cine_specific_area_id", null: false
    t.bigint "form_d_act_plan_id", null: false
  end

  create_table "clinical_practice_guidelines", force: :cascade do |t|
    t.string "title"
    t.date "date_of_publication"
    t.string "isbn"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_clinical_practice_guidelines_on_category_id"
    t.index ["colciencias_call_id"], name: "index_clinical_practice_guidelines_on_colciencias_call_id"
    t.index ["created_by"], name: "index_clinical_practice_guidelines_on_created_by"
    t.index ["geo_city_id"], name: "index_clinical_practice_guidelines_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_clinical_practice_guidelines_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_clinical_practice_guidelines_on_geo_state_id"
    t.index ["research_group_id"], name: "index_clinical_practice_guidelines_on_research_group_id"
    t.index ["updated_by"], name: "index_clinical_practice_guidelines_on_updated_by"
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

  create_table "consultancies", force: :cascade do |t|
    t.string "title"
    t.string "contract_number"
    t.text "consulting_objective"
    t.date "consultation_date"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_consultancies_on_category_id"
    t.index ["colciencias_call_id"], name: "index_consultancies_on_colciencias_call_id"
    t.index ["created_by"], name: "index_consultancies_on_created_by"
    t.index ["geo_city_id"], name: "index_consultancies_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_consultancies_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_consultancies_on_geo_state_id"
    t.index ["product_type_id"], name: "index_consultancies_on_product_type_id"
    t.index ["research_group_id"], name: "index_consultancies_on_research_group_id"
    t.index ["updated_by"], name: "index_consultancies_on_updated_by"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone", limit: 50
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identification_number"
    t.bigint "identification_type_id"
    t.index ["created_by"], name: "index_contacts_on_created_by"
    t.index ["identification_number"], name: "index_contacts_on_identification_number"
    t.index ["identification_type_id"], name: "index_contacts_on_identification_type_id"
    t.index ["updated_by"], name: "index_contacts_on_updated_by"
  end

  create_table "content_generations", force: :cascade do |t|
    t.string "magazine_name"
    t.string "isbn"
    t.string "title"
    t.date "generation_date"
    t.string "doi"
    t.string "bibliographic_reference"
    t.string "web_page"
    t.integer "volume"
    t.integer "pages_number"
    t.integer "start_page"
    t.integer "final_page"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_content_generations_on_category_id"
    t.index ["colciencias_call_id"], name: "index_content_generations_on_colciencias_call_id"
    t.index ["created_by"], name: "index_content_generations_on_created_by"
    t.index ["geo_city_id"], name: "index_content_generations_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_content_generations_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_content_generations_on_geo_state_id"
    t.index ["product_type_id"], name: "index_content_generations_on_product_type_id"
    t.index ["research_group_id"], name: "index_content_generations_on_research_group_id"
    t.index ["updated_by"], name: "index_content_generations_on_updated_by"
  end

  create_table "creation_workshops", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "finish_date"
    t.string "funding_institution"
    t.string "organization_name"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "participation_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_creation_workshops_on_category_id"
    t.index ["colciencias_call_id"], name: "index_creation_workshops_on_colciencias_call_id"
    t.index ["created_by"], name: "index_creation_workshops_on_created_by"
    t.index ["geo_city_id"], name: "index_creation_workshops_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_creation_workshops_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_creation_workshops_on_geo_state_id"
    t.index ["participation_id"], name: "index_creation_workshops_on_participation_id"
    t.index ["research_group_id"], name: "index_creation_workshops_on_research_group_id"
    t.index ["updated_by"], name: "index_creation_workshops_on_updated_by"
  end

  create_table "curricular_prj_ids_research_groups", force: :cascade do |t|
    t.bigint "research_group_id"
    t.integer "curricular_project_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_curricular_prj_ids_research_groups_on_created_by"
    t.index ["research_group_id"], name: "index_curricular_prj_ids_research_groups_on_research_group_id"
    t.index ["updated_by"], name: "index_curricular_prj_ids_research_groups_on_updated_by"
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

  create_table "dependencies", force: :cascade do |t|
    t.string "name"
    t.bigint "entity_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_dependencies_on_created_by"
    t.index ["entity_id"], name: "index_dependencies_on_entity_id"
    t.index ["updated_by"], name: "index_dependencies_on_updated_by"
  end

  create_table "dependencies_proposals", id: false, force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.bigint "dependency_id", null: false
  end

  create_table "distinctive_signs", force: :cascade do |t|
    t.string "registration_title"
    t.string "registration_number"
    t.date "date_of_obtaining"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_distinctive_signs_on_category_id"
    t.index ["colciencias_call_id"], name: "index_distinctive_signs_on_colciencias_call_id"
    t.index ["created_by"], name: "index_distinctive_signs_on_created_by"
    t.index ["geo_city_id"], name: "index_distinctive_signs_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_distinctive_signs_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_distinctive_signs_on_geo_state_id"
    t.index ["research_group_id"], name: "index_distinctive_signs_on_research_group_id"
    t.index ["updated_by"], name: "index_distinctive_signs_on_updated_by"
  end

  create_table "documents", force: :cascade do |t|
    t.string "documentable_type"
    t.bigint "documentable_id"
    t.string "doc_name", null: false
    t.string "doc_path", null: false
    t.bigint "doc_size", comment: "file size in bytes"
    t.bigint "document_type_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.string "nuxeo_id"
    t.index ["created_by"], name: "index_documents_on_created_by"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable_type_and_documentable_id"
    t.index ["updated_by"], name: "index_documents_on_updated_by"
  end

  create_table "enterprise_secrets", force: :cascade do |t|
    t.string "name"
    t.string "contract_number"
    t.float "contract_value"
    t.date "date_of_obtaining"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_enterprise_secrets_on_category_id"
    t.index ["colciencias_call_id"], name: "index_enterprise_secrets_on_colciencias_call_id"
    t.index ["created_by"], name: "index_enterprise_secrets_on_created_by"
    t.index ["geo_city_id"], name: "index_enterprise_secrets_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_enterprise_secrets_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_enterprise_secrets_on_geo_state_id"
    t.index ["research_group_id"], name: "index_enterprise_secrets_on_research_group_id"
    t.index ["updated_by"], name: "index_enterprise_secrets_on_updated_by"
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "comercial_name"
    t.date "date_of_obtaining"
    t.bigint "product_type_id"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_enterprises_on_category_id"
    t.index ["colciencias_call_id"], name: "index_enterprises_on_colciencias_call_id"
    t.index ["created_by"], name: "index_enterprises_on_created_by"
    t.index ["geo_city_id"], name: "index_enterprises_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_enterprises_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_enterprises_on_geo_state_id"
    t.index ["product_type_id"], name: "index_enterprises_on_product_type_id"
    t.index ["research_group_id"], name: "index_enterprises_on_research_group_id"
    t.index ["updated_by"], name: "index_enterprises_on_updated_by"
  end

  create_table "entities", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.integer "check_digit", limit: 2
    t.date "constitution_date"
    t.bigint "legal_nature_id"
    t.bigint "institution_type_id"
    t.bigint "geo_city_id"
    t.bigint "geo_country_id"
    t.bigint "geo_state_id"
    t.string "headquarters_address"
    t.string "email"
    t.string "phone"
    t.string "registration"
    t.string "web_page"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_entities_on_created_by"
    t.index ["geo_city_id"], name: "index_entities_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_entities_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_entities_on_geo_state_id"
    t.index ["institution_type_id"], name: "index_entities_on_institution_type_id"
    t.index ["legal_nature_id"], name: "index_entities_on_legal_nature_id"
    t.index ["updated_by"], name: "index_entities_on_updated_by"
  end

  create_table "entities_proposals", id: false, force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.bigint "entity_id", null: false
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
    t.bigint "participation_id"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["colciencias_call_id"], name: "index_events_on_colciencias_call_id"
    t.index ["created_by"], name: "index_events_on_created_by"
    t.index ["eve_type_id"], name: "index_events_on_eve_type_id"
    t.index ["geo_city_id"], name: "index_events_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_events_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_events_on_geo_state_id"
    t.index ["participation_id"], name: "index_events_on_participation_id"
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
    t.string "orcid_id"
    t.index ["created_by"], name: "index_ext_participants_on_created_by"
    t.index ["participant_type_id"], name: "index_ext_participants_on_participant_type_id"
    t.index ["producible_type", "producible_id"], name: "index_ext_participants_on_producible_type_and_producible_id"
    t.index ["updated_by"], name: "index_ext_participants_on_updated_by"
  end

  create_table "extension_projects", force: :cascade do |t|
    t.string "institution"
    t.string "administrative_act"
    t.string "project_name"
    t.date "start_date"
    t.string "name_ext_project"
    t.date "final_date"
    t.string "community_name"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_extension_projects_on_category_id"
    t.index ["colciencias_call_id"], name: "index_extension_projects_on_colciencias_call_id"
    t.index ["created_by"], name: "index_extension_projects_on_created_by"
    t.index ["geo_city_id"], name: "index_extension_projects_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_extension_projects_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_extension_projects_on_geo_state_id"
    t.index ["research_group_id"], name: "index_extension_projects_on_research_group_id"
    t.index ["updated_by"], name: "index_extension_projects_on_updated_by"
  end

  create_table "faculty_ids_research_groups", force: :cascade do |t|
    t.bigint "research_group_id"
    t.integer "faculty_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_faculty_ids_research_groups_on_created_by"
    t.index ["research_group_id"], name: "index_faculty_ids_research_groups_on_research_group_id"
    t.index ["updated_by"], name: "index_faculty_ids_research_groups_on_updated_by"
  end

  create_table "faculty_ids_research_networks", force: :cascade do |t|
    t.bigint "research_network_id"
    t.bigint "faculty_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_faculty_ids_research_networks_on_created_by"
    t.index ["research_network_id"], name: "index_faculty_ids_research_networks_on_research_network_id"
    t.index ["updated_by"], name: "index_faculty_ids_research_networks_on_updated_by"
  end

  create_table "form_a_act_plans", force: :cascade do |t|
    t.bigint "product_type_id"
    t.bigint "indicator_id"
    t.integer "goal"
    t.integer "advanced_total", default: 0
    t.integer "order", limit: 2
    t.bigint "action_plan_id"
    t.bigint "plan_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_plan_id"], name: "index_form_a_act_plans_on_action_plan_id"
    t.index ["created_by"], name: "index_form_a_act_plans_on_created_by"
    t.index ["indicator_id"], name: "index_form_a_act_plans_on_indicator_id"
    t.index ["plan_type_id"], name: "index_form_a_act_plans_on_plan_type_id"
    t.index ["product_type_id"], name: "index_form_a_act_plans_on_product_type_id"
    t.index ["updated_by"], name: "index_form_a_act_plans_on_updated_by"
  end

  create_table "form_b_act_plans", force: :cascade do |t|
    t.bigint "financing_type_id"
    t.text "description"
    t.bigint "goal_state_id"
    t.boolean "goal_achieved", default: false
    t.integer "order", limit: 2
    t.bigint "action_plan_id"
    t.bigint "plan_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_plan_id"], name: "index_form_b_act_plans_on_action_plan_id"
    t.index ["created_by"], name: "index_form_b_act_plans_on_created_by"
    t.index ["financing_type_id"], name: "index_form_b_act_plans_on_financing_type_id"
    t.index ["goal_state_id"], name: "index_form_b_act_plans_on_goal_state_id"
    t.index ["plan_type_id"], name: "index_form_b_act_plans_on_plan_type_id"
    t.index ["updated_by"], name: "index_form_b_act_plans_on_updated_by"
  end

  create_table "form_c_act_plans", force: :cascade do |t|
    t.bigint "product_type_id"
    t.text "description"
    t.integer "goal"
    t.integer "advanced_total", default: 0
    t.integer "order", limit: 2
    t.bigint "action_plan_id"
    t.bigint "plan_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_prod_type_id"
    t.index ["action_plan_id"], name: "index_form_c_act_plans_on_action_plan_id"
    t.index ["child_prod_type_id"], name: "index_form_c_act_plans_on_child_prod_type_id"
    t.index ["created_by"], name: "index_form_c_act_plans_on_created_by"
    t.index ["plan_type_id"], name: "index_form_c_act_plans_on_plan_type_id"
    t.index ["product_type_id"], name: "index_form_c_act_plans_on_product_type_id"
    t.index ["updated_by"], name: "index_form_c_act_plans_on_updated_by"
  end

  create_table "form_d_act_plans", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.bigint "goal_state_id"
    t.boolean "goal_achieved", default: false
    t.integer "order", limit: 2
    t.bigint "action_plan_id"
    t.bigint "plan_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_plan_id"], name: "index_form_d_act_plans_on_action_plan_id"
    t.index ["created_by"], name: "index_form_d_act_plans_on_created_by"
    t.index ["goal_state_id"], name: "index_form_d_act_plans_on_goal_state_id"
    t.index ["plan_type_id"], name: "index_form_d_act_plans_on_plan_type_id"
    t.index ["updated_by"], name: "index_form_d_act_plans_on_updated_by"
  end

  create_table "form_d_act_plans_oecd_disciplines", id: false, force: :cascade do |t|
    t.bigint "oecd_discipline_id", null: false
    t.bigint "form_d_act_plan_id", null: false
  end

  create_table "form_d_act_plans_oecd_knowledge_subareas", id: false, force: :cascade do |t|
    t.bigint "oecd_knowledge_subarea_id", null: false
    t.bigint "form_d_act_plan_id", null: false
  end

  create_table "form_d_act_plans_snies", id: false, force: :cascade do |t|
    t.bigint "form_d_act_plan_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "form_e_act_plans", force: :cascade do |t|
    t.text "type_description"
    t.text "description"
    t.boolean "inventoried"
    t.string "inventory_plate"
    t.bigint "action_plan_id"
    t.bigint "plan_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "classification_id"
    t.index ["action_plan_id"], name: "index_form_e_act_plans_on_action_plan_id"
    t.index ["classification_id"], name: "index_form_e_act_plans_on_classification_id"
    t.index ["created_by"], name: "index_form_e_act_plans_on_created_by"
    t.index ["updated_by"], name: "index_form_e_act_plans_on_updated_by"
  end

  create_table "functional_applications", force: :cascade do |t|
    t.text "actual_applications"
    t.text "future_applications"
    t.string "alternative_technologies"
    t.text "advantages"
    t.bigint "procedure_request_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_functional_applications_on_created_by"
    t.index ["procedure_request_id"], name: "index_functional_applications_on_procedure_request_id"
    t.index ["updated_by"], name: "index_functional_applications_on_updated_by"
  end

  create_table "geo_cities", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 10
    t.float "latitude"
    t.float "longitude"
    t.bigint "geo_state_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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

  create_table "geo_countries_potential_markets", id: false, force: :cascade do |t|
    t.bigint "potential_market_id", null: false
    t.bigint "geo_country_id", null: false
  end

  create_table "geo_states", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 10
    t.bigint "geo_country_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "is_current", default: true
    t.index ["created_by"], name: "index_gm_periods_on_created_by"
    t.index ["group_member_id"], name: "index_gm_periods_on_group_member_id"
    t.index ["role_id"], name: "index_gm_periods_on_role_id"
    t.index ["updated_by"], name: "index_gm_periods_on_updated_by"
  end

  create_table "gm_states", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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

  create_table "guide_manuals", force: :cascade do |t|
    t.string "title"
    t.date "date_of_publication"
    t.string "url"
    t.bigint "product_type_id"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_guide_manuals_on_category_id"
    t.index ["colciencias_call_id"], name: "index_guide_manuals_on_colciencias_call_id"
    t.index ["created_by"], name: "index_guide_manuals_on_created_by"
    t.index ["geo_city_id"], name: "index_guide_manuals_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_guide_manuals_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_guide_manuals_on_geo_state_id"
    t.index ["product_type_id"], name: "index_guide_manuals_on_product_type_id"
    t.index ["research_group_id"], name: "index_guide_manuals_on_research_group_id"
    t.index ["updated_by"], name: "index_guide_manuals_on_updated_by"
  end

  create_table "hist_contacts", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "dependency_id"
    t.boolean "is_current", default: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_hist_contacts_on_contact_id"
    t.index ["created_by"], name: "index_hist_contacts_on_created_by"
    t.index ["dependency_id"], name: "index_hist_contacts_on_dependency_id"
    t.index ["updated_by"], name: "index_hist_contacts_on_updated_by"
  end

  create_table "hist_legal_representatives", force: :cascade do |t|
    t.bigint "legal_representative_id"
    t.bigint "entity_id"
    t.boolean "is_current", default: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_hist_legal_representatives_on_created_by"
    t.index ["entity_id"], name: "index_hist_legal_representatives_on_entity_id"
    t.index ["legal_representative_id"], name: "index_hist_legal_representatives_on_legal_representative_id"
    t.index ["updated_by"], name: "index_hist_legal_representatives_on_updated_by"
  end

  create_table "historical_colciencias_ranks", force: :cascade do |t|
    t.integer "colciencias_call_id"
    t.integer "colciencias_category_id"
    t.integer "research_group_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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

  create_table "idi_investigation_projects", force: :cascade do |t|
    t.string "institution"
    t.string "contract_number"
    t.string "title"
    t.integer "year"
    t.string "funding_institution"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_idi_investigation_projects_on_category_id"
    t.index ["colciencias_call_id"], name: "index_idi_investigation_projects_on_colciencias_call_id"
    t.index ["created_by"], name: "index_idi_investigation_projects_on_created_by"
    t.index ["geo_city_id"], name: "index_idi_investigation_projects_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_idi_investigation_projects_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_idi_investigation_projects_on_geo_state_id"
    t.index ["research_group_id"], name: "index_idi_investigation_projects_on_research_group_id"
    t.index ["updated_by"], name: "index_idi_investigation_projects_on_updated_by"
  end

  create_table "indicators", force: :cascade do |t|
    t.bigint "subtype_id"
    t.text "ind_description"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_indicators_on_created_by"
    t.index ["subtype_id"], name: "index_indicators_on_subtype_id"
    t.index ["updated_by"], name: "index_indicators_on_updated_by"
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_industrial_designs_on_category_id"
    t.index ["colciencias_call_id"], name: "index_industrial_designs_on_colciencias_call_id"
    t.index ["created_by"], name: "index_industrial_designs_on_created_by"
    t.index ["geo_city_id"], name: "index_industrial_designs_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_industrial_designs_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_industrial_designs_on_geo_state_id"
    t.index ["research_group_id"], name: "index_industrial_designs_on_research_group_id"
    t.index ["updated_by"], name: "index_industrial_designs_on_updated_by"
  end

  create_table "informative_bulletins", force: :cascade do |t|
    t.string "title"
    t.date "elaboration_date"
    t.string "institution"
    t.string "url"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_informative_bulletins_on_category_id"
    t.index ["colciencias_call_id"], name: "index_informative_bulletins_on_colciencias_call_id"
    t.index ["created_by"], name: "index_informative_bulletins_on_created_by"
    t.index ["geo_city_id"], name: "index_informative_bulletins_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_informative_bulletins_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_informative_bulletins_on_geo_state_id"
    t.index ["research_group_id"], name: "index_informative_bulletins_on_research_group_id"
    t.index ["updated_by"], name: "index_informative_bulletins_on_updated_by"
  end

  create_table "innovations", force: :cascade do |t|
    t.string "name"
    t.string "nit"
    t.string "company_name"
    t.date "date_of_obtaining"
    t.bigint "product_type_id"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_innovations_on_category_id"
    t.index ["colciencias_call_id"], name: "index_innovations_on_colciencias_call_id"
    t.index ["created_by"], name: "index_innovations_on_created_by"
    t.index ["geo_city_id"], name: "index_innovations_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_innovations_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_innovations_on_geo_state_id"
    t.index ["product_type_id"], name: "index_innovations_on_product_type_id"
    t.index ["research_group_id"], name: "index_innovations_on_research_group_id"
    t.index ["updated_by"], name: "index_innovations_on_updated_by"
  end

  create_table "int_participants", force: :cascade do |t|
    t.string "producible_type"
    t.bigint "producible_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_integrated_circuit_diagrams_on_category_id"
    t.index ["colciencias_call_id"], name: "index_integrated_circuit_diagrams_on_colciencias_call_id"
    t.index ["created_by"], name: "index_integrated_circuit_diagrams_on_created_by"
    t.index ["geo_city_id"], name: "index_integrated_circuit_diagrams_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_integrated_circuit_diagrams_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_integrated_circuit_diagrams_on_geo_state_id"
    t.index ["research_group_id"], name: "index_integrated_circuit_diagrams_on_research_group_id"
    t.index ["updated_by"], name: "index_integrated_circuit_diagrams_on_updated_by"
  end

  create_table "investigation_projects", force: :cascade do |t|
    t.string "institution"
    t.string "title"
    t.integer "year"
    t.string "funding_institution"
    t.bigint "product_type_id"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_investigation_projects_on_category_id"
    t.index ["colciencias_call_id"], name: "index_investigation_projects_on_colciencias_call_id"
    t.index ["created_by"], name: "index_investigation_projects_on_created_by"
    t.index ["geo_city_id"], name: "index_investigation_projects_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_investigation_projects_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_investigation_projects_on_geo_state_id"
    t.index ["product_type_id"], name: "index_investigation_projects_on_product_type_id"
    t.index ["research_group_id"], name: "index_investigation_projects_on_research_group_id"
    t.index ["updated_by"], name: "index_investigation_projects_on_updated_by"
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_ip_livestock_breeds_on_category_id"
    t.index ["colciencias_call_id"], name: "index_ip_livestock_breeds_on_colciencias_call_id"
    t.index ["created_by"], name: "index_ip_livestock_breeds_on_created_by"
    t.index ["geo_city_id"], name: "index_ip_livestock_breeds_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_ip_livestock_breeds_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_ip_livestock_breeds_on_geo_state_id"
    t.index ["research_group_id"], name: "index_ip_livestock_breeds_on_research_group_id"
    t.index ["updated_by"], name: "index_ip_livestock_breeds_on_updated_by"
  end

  create_table "knowledge_networks", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "finish_date"
    t.string "funding_institution"
    t.string "funding_community"
    t.string "web_page"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_knowledge_networks_on_category_id"
    t.index ["colciencias_call_id"], name: "index_knowledge_networks_on_colciencias_call_id"
    t.index ["created_by"], name: "index_knowledge_networks_on_created_by"
    t.index ["geo_city_id"], name: "index_knowledge_networks_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_knowledge_networks_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_knowledge_networks_on_geo_state_id"
    t.index ["research_group_id"], name: "index_knowledge_networks_on_research_group_id"
    t.index ["updated_by"], name: "index_knowledge_networks_on_updated_by"
  end

  create_table "legal_representatives", force: :cascade do |t|
    t.string "name"
    t.string "identification_number"
    t.string "email"
    t.bigint "identification_type_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_legal_representatives_on_created_by"
    t.index ["identification_type_id"], name: "index_legal_representatives_on_identification_type_id"
    t.index ["updated_by"], name: "index_legal_representatives_on_updated_by"
  end

  create_table "license_agreements", force: :cascade do |t|
    t.string "work_name"
    t.date "license_grant_date"
    t.date "contract_date"
    t.string "ncd_registry_number"
    t.string "license_owner_institution"
    t.bigint "geo_city_id"
    t.bigint "contract_geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "contract_geo_state_id"
    t.bigint "contract_geo_country_id"
    t.index ["category_id"], name: "index_license_agreements_on_category_id"
    t.index ["colciencias_call_id"], name: "index_license_agreements_on_colciencias_call_id"
    t.index ["contract_geo_city_id"], name: "index_license_agreements_on_contract_geo_city_id"
    t.index ["contract_geo_country_id"], name: "index_license_agreements_on_contract_geo_country_id"
    t.index ["contract_geo_state_id"], name: "index_license_agreements_on_contract_geo_state_id"
    t.index ["created_by"], name: "index_license_agreements_on_created_by"
    t.index ["geo_city_id"], name: "index_license_agreements_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_license_agreements_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_license_agreements_on_geo_state_id"
    t.index ["research_group_id"], name: "index_license_agreements_on_research_group_id"
    t.index ["updated_by"], name: "index_license_agreements_on_updated_by"
  end

  create_table "magazine_editions", force: :cascade do |t|
    t.string "title"
    t.string "editorial_name"
    t.string "issn"
    t.integer "publication_year"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.date "editorial_date"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_magazine_editions_on_category_id"
    t.index ["colciencias_call_id"], name: "index_magazine_editions_on_colciencias_call_id"
    t.index ["created_by"], name: "index_magazine_editions_on_created_by"
    t.index ["geo_city_id"], name: "index_magazine_editions_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_magazine_editions_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_magazine_editions_on_geo_state_id"
    t.index ["research_group_id"], name: "index_magazine_editions_on_research_group_id"
    t.index ["updated_by"], name: "index_magazine_editions_on_updated_by"
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
    t.bigint "petition_status_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_new_animal_breeds_on_category_id"
    t.index ["colciencias_call_id"], name: "index_new_animal_breeds_on_colciencias_call_id"
    t.index ["created_by"], name: "index_new_animal_breeds_on_created_by"
    t.index ["geo_city_id"], name: "index_new_animal_breeds_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_new_animal_breeds_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_new_animal_breeds_on_geo_state_id"
    t.index ["petition_status_id"], name: "index_new_animal_breeds_on_petition_status_id"
    t.index ["research_group_id"], name: "index_new_animal_breeds_on_research_group_id"
    t.index ["updated_by"], name: "index_new_animal_breeds_on_updated_by"
  end

  create_table "new_genetic_sequences", force: :cascade do |t|
    t.string "name"
    t.date "obtaining_date"
    t.string "certifying_institution"
    t.string "database_name"
    t.string "database_url"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_new_genetic_sequences_on_category_id"
    t.index ["colciencias_call_id"], name: "index_new_genetic_sequences_on_colciencias_call_id"
    t.index ["created_by"], name: "index_new_genetic_sequences_on_created_by"
    t.index ["geo_city_id"], name: "index_new_genetic_sequences_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_new_genetic_sequences_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_new_genetic_sequences_on_geo_state_id"
    t.index ["research_group_id"], name: "index_new_genetic_sequences_on_research_group_id"
    t.index ["updated_by"], name: "index_new_genetic_sequences_on_updated_by"
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_new_scientific_records_on_category_id"
    t.index ["colciencias_call_id"], name: "index_new_scientific_records_on_colciencias_call_id"
    t.index ["created_by"], name: "index_new_scientific_records_on_created_by"
    t.index ["geo_city_id"], name: "index_new_scientific_records_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_new_scientific_records_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_new_scientific_records_on_geo_state_id"
    t.index ["research_group_id"], name: "index_new_scientific_records_on_research_group_id"
    t.index ["updated_by"], name: "index_new_scientific_records_on_updated_by"
  end

  create_table "next_tasks", force: :cascade do |t|
    t.bigint "actual_task_id"
    t.bigint "following_task_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["actual_task_id"], name: "index_next_tasks_on_actual_task_id"
    t.index ["created_by"], name: "index_next_tasks_on_created_by"
    t.index ["following_task_id"], name: "index_next_tasks_on_following_task_id"
    t.index ["updated_by"], name: "index_next_tasks_on_updated_by"
  end

  create_table "nutraceutical_products", force: :cascade do |t|
    t.string "name"
    t.date "date_of_obtaining"
    t.string "research_project_title"
    t.string "consecutive_registration_invima"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_nutraceutical_products_on_category_id"
    t.index ["colciencias_call_id"], name: "index_nutraceutical_products_on_colciencias_call_id"
    t.index ["created_by"], name: "index_nutraceutical_products_on_created_by"
    t.index ["geo_city_id"], name: "index_nutraceutical_products_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_nutraceutical_products_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_nutraceutical_products_on_geo_state_id"
    t.index ["research_group_id"], name: "index_nutraceutical_products_on_research_group_id"
    t.index ["updated_by"], name: "index_nutraceutical_products_on_updated_by"
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

  create_table "oecd_disciplines_research_networks", id: false, force: :cascade do |t|
    t.bigint "oecd_discipline_id", null: false
    t.bigint "research_network_id", null: false
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

  create_table "otri_professionals", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.bigint "user_id"
    t.bigint "professional_role_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_otri_professionals_on_created_by"
    t.index ["professional_role_id"], name: "index_otri_professionals_on_professional_role_id"
    t.index ["updated_by"], name: "index_otri_professionals_on_updated_by"
    t.index ["user_id"], name: "index_otri_professionals_on_user_id"
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
    t.string "journal_name"
    t.bigint "geo_country_id"
    t.bigint "geo_state_id"
    t.index ["category_id"], name: "index_papers_on_category_id"
    t.index ["colciencias_call_id"], name: "index_papers_on_colciencias_call_id"
    t.index ["created_by"], name: "index_papers_on_created_by"
    t.index ["geo_city_id"], name: "index_papers_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_papers_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_papers_on_geo_state_id"
    t.index ["paper_type_id"], name: "index_papers_on_paper_type_id"
    t.index ["research_group_id"], name: "index_papers_on_research_group_id"
    t.index ["updated_by"], name: "index_papers_on_updated_by"
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
    t.bigint "patent_type_id"
    t.index ["category_id"], name: "index_patents_on_category_id"
    t.index ["colciencias_call_id"], name: "index_patents_on_colciencias_call_id"
    t.index ["created_by"], name: "index_patents_on_created_by"
    t.index ["patent_state_id"], name: "index_patents_on_patent_state_id"
    t.index ["patent_type_id"], name: "index_patents_on_patent_type_id"
    t.index ["research_group_id"], name: "index_patents_on_research_group_id"
    t.index ["updated_by"], name: "index_patents_on_updated_by"
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_plant_ind_prototypes_on_category_id"
    t.index ["colciencias_call_id"], name: "index_plant_ind_prototypes_on_colciencias_call_id"
    t.index ["created_by"], name: "index_plant_ind_prototypes_on_created_by"
    t.index ["geo_city_id"], name: "index_plant_ind_prototypes_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_plant_ind_prototypes_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_plant_ind_prototypes_on_geo_state_id"
    t.index ["plt_type_id"], name: "index_plant_ind_prototypes_on_plt_type_id"
    t.index ["research_group_id"], name: "index_plant_ind_prototypes_on_research_group_id"
    t.index ["updated_by"], name: "index_plant_ind_prototypes_on_updated_by"
  end

  create_table "potential_markets", force: :cascade do |t|
    t.bigint "market_participation_id"
    t.integer "necesary_time"
    t.boolean "product_dependency"
    t.string "product_dependency_name"
    t.boolean "institution_participation"
    t.string "institution_participation_name"
    t.string "stakeholder"
    t.bigint "success_rank_id"
    t.string "market_place"
    t.bigint "procedure_request_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_potential_markets_on_created_by"
    t.index ["market_participation_id"], name: "index_potential_markets_on_market_participation_id"
    t.index ["procedure_request_id"], name: "index_potential_markets_on_procedure_request_id"
    t.index ["success_rank_id"], name: "index_potential_markets_on_success_rank_id"
    t.index ["updated_by"], name: "index_potential_markets_on_updated_by"
  end

  create_table "potential_markets_segments", id: false, force: :cascade do |t|
    t.bigint "potential_market_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "procedure_requests", force: :cascade do |t|
    t.text "approached_problem"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_procedure_requests_on_created_by"
    t.index ["updated_by"], name: "index_procedure_requests_on_updated_by"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.index ["created_by"], name: "index_procedures_on_created_by"
    t.index ["updated_by"], name: "index_procedures_on_updated_by"
  end

  create_table "professional_roles", force: :cascade do |t|
    t.string "name"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["created_by"], name: "index_professional_roles_on_created_by"
    t.index ["updated_by"], name: "index_professional_roles_on_updated_by"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "duration", limit: 2
    t.bigint "proposal_status_id"
    t.bigint "project_type_id"
    t.bigint "call_id"
    t.bigint "geo_city_id"
    t.bigint "geo_country_id"
    t.bigint "geo_state_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_proposals_on_call_id"
    t.index ["created_by"], name: "index_proposals_on_created_by"
    t.index ["geo_city_id"], name: "index_proposals_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_proposals_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_proposals_on_geo_state_id"
    t.index ["project_type_id"], name: "index_proposals_on_project_type_id"
    t.index ["proposal_status_id"], name: "index_proposals_on_proposal_status_id"
    t.index ["updated_by"], name: "index_proposals_on_updated_by"
  end

  create_table "proposals_research_groups", id: false, force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.bigint "research_group_id", null: false
  end

  create_table "protocol_acts", force: :cascade do |t|
    t.string "title"
    t.date "date_of_publication"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_protocol_acts_on_category_id"
    t.index ["colciencias_call_id"], name: "index_protocol_acts_on_colciencias_call_id"
    t.index ["created_by"], name: "index_protocol_acts_on_created_by"
    t.index ["geo_city_id"], name: "index_protocol_acts_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_protocol_acts_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_protocol_acts_on_geo_state_id"
    t.index ["product_type_id"], name: "index_protocol_acts_on_product_type_id"
    t.index ["research_group_id"], name: "index_protocol_acts_on_research_group_id"
    t.index ["updated_by"], name: "index_protocol_acts_on_updated_by"
  end

  create_table "publications", force: :cascade do |t|
    t.string "name"
    t.string "project_title"
    t.date "start_date"
    t.date "final_date"
    t.string "funding_institution"
    t.string "url"
    t.string "circulation_route"
    t.string "target_audiences"
    t.integer "duration"
    t.bigint "duration_type_id"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_publications_on_category_id"
    t.index ["colciencias_call_id"], name: "index_publications_on_colciencias_call_id"
    t.index ["created_by"], name: "index_publications_on_created_by"
    t.index ["duration_type_id"], name: "index_publications_on_duration_type_id"
    t.index ["geo_city_id"], name: "index_publications_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_publications_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_publications_on_geo_state_id"
    t.index ["product_type_id"], name: "index_publications_on_product_type_id"
    t.index ["research_group_id"], name: "index_publications_on_research_group_id"
    t.index ["updated_by"], name: "index_publications_on_updated_by"
  end

  create_table "read_attributes", force: :cascade do |t|
    t.bigint "task_attribute_id"
    t.bigint "task_model_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["created_by"], name: "index_read_attributes_on_created_by"
    t.index ["task_attribute_id"], name: "index_read_attributes_on_task_attribute_id"
    t.index ["task_model_id"], name: "index_read_attributes_on_task_model_id"
    t.index ["updated_by"], name: "index_read_attributes_on_updated_by"
  end

  create_table "regulations", force: :cascade do |t|
    t.string "title"
    t.date "date_of_publication"
    t.string "issuing_entity"
    t.bigint "regulation_type_id"
    t.bigint "product_type_id"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_regulations_on_category_id"
    t.index ["colciencias_call_id"], name: "index_regulations_on_colciencias_call_id"
    t.index ["created_by"], name: "index_regulations_on_created_by"
    t.index ["geo_city_id"], name: "index_regulations_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_regulations_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_regulations_on_geo_state_id"
    t.index ["product_type_id"], name: "index_regulations_on_product_type_id"
    t.index ["regulation_type_id"], name: "index_regulations_on_regulation_type_id"
    t.index ["research_group_id"], name: "index_regulations_on_research_group_id"
    t.index ["updated_by"], name: "index_regulations_on_updated_by"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.string "project_name"
    t.date "date_of_elaboration"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_reports_on_category_id"
    t.index ["colciencias_call_id"], name: "index_reports_on_colciencias_call_id"
    t.index ["created_by"], name: "index_reports_on_created_by"
    t.index ["geo_city_id"], name: "index_reports_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_reports_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_reports_on_geo_state_id"
    t.index ["product_type_id"], name: "index_reports_on_product_type_id"
    t.index ["research_group_id"], name: "index_reports_on_research_group_id"
    t.index ["updated_by"], name: "index_reports_on_updated_by"
  end

  create_table "request_has_application_areas", force: :cascade do |t|
    t.bigint "procedure_request_id"
    t.bigint "application_area_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_area_id"], name: "index_request_has_application_areas_on_application_area_id"
    t.index ["created_by"], name: "index_request_has_application_areas_on_created_by"
    t.index ["procedure_request_id"], name: "index_request_has_application_areas_on_procedure_request_id"
    t.index ["updated_by"], name: "index_request_has_application_areas_on_updated_by"
  end

  create_table "request_has_procedures", force: :cascade do |t|
    t.bigint "procedure_id"
    t.bigint "procedure_request_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_request_has_procedures_on_created_by"
    t.index ["procedure_id"], name: "index_request_has_procedures_on_procedure_id"
    t.index ["procedure_request_id"], name: "index_request_has_procedures_on_procedure_request_id"
    t.index ["updated_by"], name: "index_request_has_procedures_on_updated_by"
  end

  create_table "research_creation_works", force: :cascade do |t|
    t.string "title"
    t.date "creation_and_selection_date"
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
    t.bigint "nature_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_research_creation_works_on_category_id"
    t.index ["colciencias_call_id"], name: "index_research_creation_works_on_colciencias_call_id"
    t.index ["created_by"], name: "index_research_creation_works_on_created_by"
    t.index ["geo_city_id"], name: "index_research_creation_works_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_research_creation_works_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_research_creation_works_on_geo_state_id"
    t.index ["knwl_spec_area_id"], name: "index_research_creation_works_on_knwl_spec_area_id"
    t.index ["nature_id"], name: "index_research_creation_works_on_nature_id"
    t.index ["research_group_id"], name: "index_research_creation_works_on_research_group_id"
    t.index ["updated_by"], name: "index_research_creation_works_on_updated_by"
  end

  create_table "research_creation_works_work_types", id: false, force: :cascade do |t|
    t.bigint "research_creation_work_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "research_focuses_form_d_plans", id: false, force: :cascade do |t|
    t.bigint "subtype_id", null: false
    t.bigint "form_d_act_plan_id", null: false
  end

  create_table "research_focuses_networks", id: false, force: :cascade do |t|
    t.bigint "subtype_id", null: false
    t.bigint "research_network_id", null: false
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
    t.bigint "parent_id"
    t.bigint "snies_id"
    t.index ["cine_broad_area_id"], name: "index_research_groups_on_cine_broad_area_id"
    t.index ["cine_specific_area_id"], name: "index_research_groups_on_cine_specific_area_id"
    t.index ["created_by"], name: "index_research_groups_on_created_by"
    t.index ["group_state_id"], name: "index_research_groups_on_group_state_id"
    t.index ["group_type_id"], name: "index_research_groups_on_group_type_id"
    t.index ["oecd_knowledge_area_id"], name: "index_research_groups_on_oecd_knowledge_area_id"
    t.index ["oecd_knowledge_subarea_id"], name: "index_research_groups_on_oecd_knowledge_subarea_id"
    t.index ["parent_id"], name: "index_research_groups_on_parent_id"
    t.index ["snies_id"], name: "index_research_groups_on_snies_id"
    t.index ["updated_by"], name: "index_research_groups_on_updated_by"
  end

  create_table "research_groups_research_networks", force: :cascade do |t|
    t.bigint "research_group_id"
    t.bigint "research_network_id"
    t.boolean "has_expiration", default: false
    t.date "expiration_date"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_research_groups_research_networks_on_created_by"
    t.index ["research_group_id"], name: "index_research_groups_research_networks_on_research_group_id"
    t.index ["research_network_id"], name: "index_research_groups_research_networks_on_research_network_id"
    t.index ["updated_by"], name: "index_research_groups_research_networks_on_updated_by"
  end

  create_table "research_networks", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.date "request_date"
    t.text "mission"
    t.text "vision"
    t.text "advantage"
    t.bigint "researcher_id"
    t.bigint "main_research_group_id"
    t.bigint "network_type_id"
    t.bigint "cine_broad_area_id"
    t.bigint "cine_specific_area_id"
    t.bigint "oecd_knowledge_subarea_id"
    t.bigint "oecd_knowledge_area_id"
    t.text "academic_responsibilities"
    t.text "financial_responsibilities"
    t.text "legal_responsibilities"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "snies_id"
    t.index ["cine_broad_area_id"], name: "index_research_networks_on_cine_broad_area_id"
    t.index ["cine_specific_area_id"], name: "index_research_networks_on_cine_specific_area_id"
    t.index ["created_by"], name: "index_research_networks_on_created_by"
    t.index ["main_research_group_id"], name: "index_research_networks_on_main_research_group_id"
    t.index ["network_type_id"], name: "index_research_networks_on_network_type_id"
    t.index ["oecd_knowledge_area_id"], name: "index_research_networks_on_oecd_knowledge_area_id"
    t.index ["oecd_knowledge_subarea_id"], name: "index_research_networks_on_oecd_knowledge_subarea_id"
    t.index ["researcher_id"], name: "index_research_networks_on_researcher_id"
    t.index ["snies_id"], name: "index_research_networks_on_snies_id"
    t.index ["updated_by"], name: "index_research_networks_on_updated_by"
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
    t.string "cvlac"
    t.index ["created_by"], name: "index_researchers_on_created_by"
    t.index ["identification_number"], name: "index_researchers_on_identification_number", unique: true
    t.index ["updated_by"], name: "index_researchers_on_updated_by"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_roles_on_created_by"
    t.index ["updated_by"], name: "index_roles_on_updated_by"
  end

  create_table "schedule_activities", force: :cascade do |t|
    t.bigint "call_id"
    t.integer "sa_order"
    t.text "sa_description"
    t.text "sa_date"
    t.string "sa_responsible"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "sa_start_date"
    t.date "sa_end_date"
    t.index ["call_id"], name: "index_schedule_activities_on_call_id"
    t.index ["created_by"], name: "index_schedule_activities_on_created_by"
    t.index ["updated_by"], name: "index_schedule_activities_on_updated_by"
  end

  create_table "scientific_collections", force: :cascade do |t|
    t.string "name"
    t.date "date_of_obtaining"
    t.string "managing_institution_name"
    t.string "curator_name"
    t.date "last_conservatorship_date"
    t.date "validity_and_use"
    t.text "information_included"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_scientific_collections_on_category_id"
    t.index ["colciencias_call_id"], name: "index_scientific_collections_on_colciencias_call_id"
    t.index ["created_by"], name: "index_scientific_collections_on_created_by"
    t.index ["geo_city_id"], name: "index_scientific_collections_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_scientific_collections_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_scientific_collections_on_geo_state_id"
    t.index ["research_group_id"], name: "index_scientific_collections_on_research_group_id"
    t.index ["updated_by"], name: "index_scientific_collections_on_updated_by"
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
    t.string "journal_name"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_scientific_notes_on_category_id"
    t.index ["colciencias_call_id"], name: "index_scientific_notes_on_colciencias_call_id"
    t.index ["created_by"], name: "index_scientific_notes_on_created_by"
    t.index ["geo_city_id"], name: "index_scientific_notes_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_scientific_notes_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_scientific_notes_on_geo_state_id"
    t.index ["research_group_id"], name: "index_scientific_notes_on_research_group_id"
    t.index ["updated_by"], name: "index_scientific_notes_on_updated_by"
  end

  create_table "simple_books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.date "publication_date"
    t.string "url"
    t.string "editorial_name"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "product_type_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_simple_books_on_category_id"
    t.index ["colciencias_call_id"], name: "index_simple_books_on_colciencias_call_id"
    t.index ["created_by"], name: "index_simple_books_on_created_by"
    t.index ["geo_city_id"], name: "index_simple_books_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_simple_books_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_simple_books_on_geo_state_id"
    t.index ["product_type_id"], name: "index_simple_books_on_product_type_id"
    t.index ["research_group_id"], name: "index_simple_books_on_research_group_id"
    t.index ["updated_by"], name: "index_simple_books_on_updated_by"
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_software_on_category_id"
    t.index ["colciencias_call_id"], name: "index_software_on_colciencias_call_id"
    t.index ["created_by"], name: "index_software_on_created_by"
    t.index ["geo_city_id"], name: "index_software_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_software_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_software_on_geo_state_id"
    t.index ["research_group_id"], name: "index_software_on_research_group_id"
    t.index ["updated_by"], name: "index_software_on_updated_by"
  end

  create_table "subtypes", force: :cascade do |t|
    t.string "st_name"
    t.text "st_description"
    t.bigint "parent_id"
    t.bigint "type_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "required", default: false
    t.boolean "multiple", default: false
    t.index ["created_by"], name: "index_subtypes_on_created_by"
    t.index ["parent_id"], name: "index_subtypes_on_parent_id"
    t.index ["type_id"], name: "index_subtypes_on_type_id"
    t.index ["updated_by"], name: "index_subtypes_on_updated_by"
  end

  create_table "task_attributes", force: :cascade do |t|
    t.bigint "attribute_sub_type_id"
    t.bigint "task_model_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["attribute_sub_type_id"], name: "index_task_attributes_on_attribute_sub_type_id"
    t.index ["created_by"], name: "index_task_attributes_on_created_by"
    t.index ["task_model_id"], name: "index_task_attributes_on_task_model_id"
    t.index ["updated_by"], name: "index_task_attributes_on_updated_by"
  end

  create_table "task_has_states", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "state_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_task_has_states_on_created_by"
    t.index ["state_id"], name: "index_task_has_states_on_state_id"
    t.index ["task_id"], name: "index_task_has_states_on_task_id"
    t.index ["updated_by"], name: "index_task_has_states_on_updated_by"
  end

  create_table "task_models", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.bigint "professional_role_id"
    t.bigint "procedure_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["created_by"], name: "index_task_models_on_created_by"
    t.index ["procedure_id"], name: "index_task_models_on_procedure_id"
    t.index ["professional_role_id"], name: "index_task_models_on_professional_role_id"
    t.index ["updated_by"], name: "index_task_models_on_updated_by"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "otri_professional_id"
    t.bigint "task_model_id"
    t.bigint "intelectual_property_id"
    t.boolean "desition"
    t.date "expired_date"
    t.bigint "request_has_procedure_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_tasks_on_created_by"
    t.index ["intelectual_property_id"], name: "index_tasks_on_intelectual_property_id"
    t.index ["otri_professional_id"], name: "index_tasks_on_otri_professional_id"
    t.index ["request_has_procedure_id"], name: "index_tasks_on_request_has_procedure_id"
    t.index ["task_model_id"], name: "index_tasks_on_task_model_id"
    t.index ["updated_by"], name: "index_tasks_on_updated_by"
  end

  create_table "technical_concepts", force: :cascade do |t|
    t.string "title"
    t.date "request_date"
    t.bigint "consecutive_number"
    t.date "send_date"
    t.string "requesting_institution_name"
    t.bigint "geo_city_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_technical_concepts_on_category_id"
    t.index ["colciencias_call_id"], name: "index_technical_concepts_on_colciencias_call_id"
    t.index ["created_by"], name: "index_technical_concepts_on_created_by"
    t.index ["geo_city_id"], name: "index_technical_concepts_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_technical_concepts_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_technical_concepts_on_geo_state_id"
    t.index ["research_group_id"], name: "index_technical_concepts_on_research_group_id"
    t.index ["updated_by"], name: "index_technical_concepts_on_updated_by"
  end

  create_table "technological_situations", force: :cascade do |t|
    t.bigint "invention_type_id"
    t.text "required_equipment"
    t.text "pending_development"
    t.text "differential_factors"
    t.boolean "pi_requested"
    t.boolean "media_spread"
    t.string "channel_spread"
    t.boolean "spread_plans"
    t.bigint "procedure_request_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_technological_situations_on_created_by"
    t.index ["invention_type_id"], name: "index_technological_situations_on_invention_type_id"
    t.index ["procedure_request_id"], name: "index_technological_situations_on_procedure_request_id"
    t.index ["updated_by"], name: "index_technological_situations_on_updated_by"
  end

  create_table "technological_situations_development_stages", id: false, force: :cascade do |t|
    t.bigint "technological_situation_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "technological_situations_technology_reasons", id: false, force: :cascade do |t|
    t.bigint "technological_situation_id", null: false
    t.bigint "subtype_id", null: false
  end

  create_table "technology_descriptions", force: :cascade do |t|
    t.string "denomination"
    t.text "product_or_process_features"
    t.string "artistic_representation"
    t.string "key_words"
    t.bigint "procedure_request_id"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by"], name: "index_technology_descriptions_on_created_by"
    t.index ["procedure_request_id"], name: "index_technology_descriptions_on_procedure_request_id"
    t.index ["updated_by"], name: "index_technology_descriptions_on_updated_by"
  end

  create_table "training_courses", force: :cascade do |t|
    t.string "institution"
    t.string "id_administrative_act"
    t.string "program_name"
    t.date "date"
    t.string "faculty"
    t.string "num_administrative_act"
    t.bigint "geo_city_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_training_courses_on_category_id"
    t.index ["colciencias_call_id"], name: "index_training_courses_on_colciencias_call_id"
    t.index ["created_by"], name: "index_training_courses_on_created_by"
    t.index ["geo_city_id"], name: "index_training_courses_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_training_courses_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_training_courses_on_geo_state_id"
    t.index ["research_group_id"], name: "index_training_courses_on_research_group_id"
    t.index ["updated_by"], name: "index_training_courses_on_updated_by"
  end

  create_table "types", force: :cascade do |t|
    t.string "t_name", null: false
    t.text "t_description"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.index ["created_by"], name: "index_types_on_created_by"
    t.index ["updated_by"], name: "index_types_on_updated_by"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
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
    t.integer "faculties_ids", default: [], array: true
    t.index ["created_by"], name: "index_users_on_created_by"
    t.index ["faculties_ids"], name: "index_users_on_faculties_ids", using: :gin
    t.index ["identification_number"], name: "index_users_on_identification_number", unique: true
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
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.index ["category_id"], name: "index_vegetable_varieties_on_category_id"
    t.index ["colciencias_call_id"], name: "index_vegetable_varieties_on_colciencias_call_id"
    t.index ["created_by"], name: "index_vegetable_varieties_on_created_by"
    t.index ["cycle_type_id"], name: "index_vegetable_varieties_on_cycle_type_id"
    t.index ["geo_city_id"], name: "index_vegetable_varieties_on_geo_city_id"
    t.index ["geo_country_id"], name: "index_vegetable_varieties_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_vegetable_varieties_on_geo_state_id"
    t.index ["petition_status_id"], name: "index_vegetable_varieties_on_petition_status_id"
    t.index ["research_group_id"], name: "index_vegetable_varieties_on_research_group_id"
    t.index ["updated_by"], name: "index_vegetable_varieties_on_updated_by"
  end

  create_table "working_papers", force: :cascade do |t|
    t.string "title"
    t.date "elaboration_date"
    t.string "related_institution"
    t.string "doi"
    t.string "web_page"
    t.bigint "category_id"
    t.bigint "research_group_id"
    t.bigint "colciencias_call_id"
    t.text "observation"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_working_papers_on_category_id"
    t.index ["colciencias_call_id"], name: "index_working_papers_on_colciencias_call_id"
    t.index ["created_by"], name: "index_working_papers_on_created_by"
    t.index ["research_group_id"], name: "index_working_papers_on_research_group_id"
    t.index ["updated_by"], name: "index_working_papers_on_updated_by"
  end

  add_foreign_key "accompaniment_consultancies", "colciencias_calls"
  add_foreign_key "accompaniment_consultancies", "geo_cities"
  add_foreign_key "accompaniment_consultancies", "geo_countries"
  add_foreign_key "accompaniment_consultancies", "geo_states"
  add_foreign_key "accompaniment_consultancies", "research_groups"
  add_foreign_key "accompaniment_consultancies", "subtypes", column: "category_id"
  add_foreign_key "accompaniment_consultancies", "users", column: "created_by"
  add_foreign_key "accompaniment_consultancies", "users", column: "updated_by"
  add_foreign_key "action_plans", "research_groups"
  add_foreign_key "action_plans", "users", column: "created_by"
  add_foreign_key "action_plans", "users", column: "updated_by"
  add_foreign_key "affiliated_entities", "entities"
  add_foreign_key "affiliated_entities", "geo_countries"
  add_foreign_key "affiliated_entities", "research_networks"
  add_foreign_key "affiliated_entities", "subtypes", column: "institution_type_id"
  add_foreign_key "affiliated_entities", "users", column: "created_by"
  add_foreign_key "affiliated_entities", "users", column: "updated_by"
  add_foreign_key "appropriation_processes", "colciencias_calls"
  add_foreign_key "appropriation_processes", "research_groups"
  add_foreign_key "appropriation_processes", "subtypes", column: "category_id"
  add_foreign_key "appropriation_processes", "subtypes", column: "product_type_id"
  add_foreign_key "appropriation_processes", "users", column: "created_by"
  add_foreign_key "appropriation_processes", "users", column: "updated_by"
  add_foreign_key "awards", "research_creation_works"
  add_foreign_key "awards", "users", column: "created_by"
  add_foreign_key "awards", "users", column: "updated_by"
  add_foreign_key "bills", "colciencias_calls"
  add_foreign_key "bills", "research_groups"
  add_foreign_key "bills", "subtypes", column: "category_id"
  add_foreign_key "bills", "users", column: "created_by"
  add_foreign_key "bills", "users", column: "updated_by"
  add_foreign_key "book_chapters", "colciencias_calls"
  add_foreign_key "book_chapters", "geo_cities"
  add_foreign_key "book_chapters", "geo_countries"
  add_foreign_key "book_chapters", "geo_states"
  add_foreign_key "book_chapters", "research_groups"
  add_foreign_key "book_chapters", "subtypes", column: "category_id"
  add_foreign_key "book_chapters", "users", column: "created_by"
  add_foreign_key "book_chapters", "users", column: "updated_by"
  add_foreign_key "books", "colciencias_calls"
  add_foreign_key "books", "geo_cities"
  add_foreign_key "books", "geo_countries"
  add_foreign_key "books", "geo_states"
  add_foreign_key "books", "research_groups"
  add_foreign_key "books", "subtypes", column: "book_type_id"
  add_foreign_key "books", "subtypes", column: "category_id"
  add_foreign_key "books", "users", column: "created_by"
  add_foreign_key "books", "users", column: "updated_by"
  add_foreign_key "budgets", "subtypes", column: "budget_type_id"
  add_foreign_key "budgets", "tasks"
  add_foreign_key "budgets", "users", column: "created_by"
  add_foreign_key "budgets", "users", column: "updated_by"
  add_foreign_key "call_documents", "calls"
  add_foreign_key "call_documents", "subtypes", column: "document_id"
  add_foreign_key "call_documents", "users", column: "created_by"
  add_foreign_key "call_documents", "users", column: "updated_by"
  add_foreign_key "call_eval_criteria", "calls"
  add_foreign_key "call_eval_criteria", "subtypes", column: "eval_criterion_id"
  add_foreign_key "call_eval_criteria", "users", column: "created_by"
  add_foreign_key "call_eval_criteria", "users", column: "updated_by"
  add_foreign_key "call_items", "calls"
  add_foreign_key "call_items", "subtypes", column: "item_id"
  add_foreign_key "call_items", "users", column: "created_by"
  add_foreign_key "call_items", "users", column: "updated_by"
  add_foreign_key "calls", "subtypes", column: "call_beneficiary_id"
  add_foreign_key "calls", "subtypes", column: "call_state_id"
  add_foreign_key "calls", "subtypes", column: "call_type_id"
  add_foreign_key "calls", "users", column: "created_by"
  add_foreign_key "calls", "users", column: "updated_by"
  add_foreign_key "calls_indicators", "calls"
  add_foreign_key "calls_indicators", "indicators"
  add_foreign_key "calls_indicators", "users", column: "created_by"
  add_foreign_key "calls_indicators", "users", column: "updated_by"
  add_foreign_key "chapters", "chapters", column: "ch_parent_id"
  add_foreign_key "chapters", "users", column: "created_by"
  add_foreign_key "chapters", "users", column: "updated_by"
  add_foreign_key "cine_broad_areas", "users", column: "created_by"
  add_foreign_key "cine_broad_areas", "users", column: "updated_by"
  add_foreign_key "cine_detailed_areas", "cine_specific_areas"
  add_foreign_key "cine_detailed_areas", "users", column: "created_by"
  add_foreign_key "cine_detailed_areas", "users", column: "updated_by"
  add_foreign_key "cine_specific_areas", "cine_broad_areas"
  add_foreign_key "cine_specific_areas", "users", column: "created_by"
  add_foreign_key "cine_specific_areas", "users", column: "updated_by"
  add_foreign_key "clinical_practice_guidelines", "colciencias_calls"
  add_foreign_key "clinical_practice_guidelines", "geo_cities"
  add_foreign_key "clinical_practice_guidelines", "geo_countries"
  add_foreign_key "clinical_practice_guidelines", "geo_states"
  add_foreign_key "clinical_practice_guidelines", "research_groups"
  add_foreign_key "clinical_practice_guidelines", "subtypes", column: "category_id"
  add_foreign_key "clinical_practice_guidelines", "users", column: "created_by"
  add_foreign_key "clinical_practice_guidelines", "users", column: "updated_by"
  add_foreign_key "colciencias_calls", "users", column: "created_by"
  add_foreign_key "colciencias_calls", "users", column: "updated_by"
  add_foreign_key "colciencias_categories", "users", column: "created_by"
  add_foreign_key "colciencias_categories", "users", column: "updated_by"
  add_foreign_key "consultancies", "colciencias_calls"
  add_foreign_key "consultancies", "geo_cities"
  add_foreign_key "consultancies", "geo_countries"
  add_foreign_key "consultancies", "geo_states"
  add_foreign_key "consultancies", "research_groups"
  add_foreign_key "consultancies", "subtypes", column: "category_id"
  add_foreign_key "consultancies", "subtypes", column: "product_type_id"
  add_foreign_key "consultancies", "users", column: "created_by"
  add_foreign_key "consultancies", "users", column: "updated_by"
  add_foreign_key "contacts", "subtypes", column: "identification_type_id"
  add_foreign_key "contacts", "users", column: "created_by"
  add_foreign_key "contacts", "users", column: "updated_by"
  add_foreign_key "content_generations", "colciencias_calls"
  add_foreign_key "content_generations", "geo_cities"
  add_foreign_key "content_generations", "geo_countries"
  add_foreign_key "content_generations", "geo_states"
  add_foreign_key "content_generations", "research_groups"
  add_foreign_key "content_generations", "subtypes", column: "category_id"
  add_foreign_key "content_generations", "subtypes", column: "product_type_id"
  add_foreign_key "content_generations", "users", column: "created_by"
  add_foreign_key "content_generations", "users", column: "updated_by"
  add_foreign_key "creation_workshops", "colciencias_calls"
  add_foreign_key "creation_workshops", "geo_cities"
  add_foreign_key "creation_workshops", "geo_countries"
  add_foreign_key "creation_workshops", "geo_states"
  add_foreign_key "creation_workshops", "research_groups"
  add_foreign_key "creation_workshops", "subtypes", column: "category_id"
  add_foreign_key "creation_workshops", "subtypes", column: "participation_id"
  add_foreign_key "creation_workshops", "users", column: "created_by"
  add_foreign_key "creation_workshops", "users", column: "updated_by"
  add_foreign_key "curricular_prj_ids_research_groups", "research_groups"
  add_foreign_key "curricular_prj_ids_research_groups", "users", column: "created_by"
  add_foreign_key "curricular_prj_ids_research_groups", "users", column: "updated_by"
  add_foreign_key "degree_works", "colciencias_calls"
  add_foreign_key "degree_works", "research_groups"
  add_foreign_key "degree_works", "subtypes", column: "category_id"
  add_foreign_key "degree_works", "subtypes", column: "dw_type_id"
  add_foreign_key "degree_works", "users", column: "created_by"
  add_foreign_key "degree_works", "users", column: "updated_by"
  add_foreign_key "dependencies", "entities"
  add_foreign_key "dependencies", "users", column: "created_by"
  add_foreign_key "dependencies", "users", column: "updated_by"
  add_foreign_key "distinctive_signs", "colciencias_calls"
  add_foreign_key "distinctive_signs", "geo_cities"
  add_foreign_key "distinctive_signs", "geo_countries"
  add_foreign_key "distinctive_signs", "geo_states"
  add_foreign_key "distinctive_signs", "research_groups"
  add_foreign_key "distinctive_signs", "subtypes", column: "category_id"
  add_foreign_key "distinctive_signs", "users", column: "created_by"
  add_foreign_key "distinctive_signs", "users", column: "updated_by"
  add_foreign_key "documents", "subtypes", column: "document_type_id"
  add_foreign_key "documents", "users", column: "created_by"
  add_foreign_key "documents", "users", column: "updated_by"
  add_foreign_key "enterprise_secrets", "colciencias_calls"
  add_foreign_key "enterprise_secrets", "geo_cities"
  add_foreign_key "enterprise_secrets", "geo_countries"
  add_foreign_key "enterprise_secrets", "geo_states"
  add_foreign_key "enterprise_secrets", "research_groups"
  add_foreign_key "enterprise_secrets", "subtypes", column: "category_id"
  add_foreign_key "enterprise_secrets", "users", column: "created_by"
  add_foreign_key "enterprise_secrets", "users", column: "updated_by"
  add_foreign_key "enterprises", "colciencias_calls"
  add_foreign_key "enterprises", "geo_cities"
  add_foreign_key "enterprises", "geo_countries"
  add_foreign_key "enterprises", "geo_states"
  add_foreign_key "enterprises", "research_groups"
  add_foreign_key "enterprises", "subtypes", column: "category_id"
  add_foreign_key "enterprises", "subtypes", column: "product_type_id"
  add_foreign_key "enterprises", "users", column: "created_by"
  add_foreign_key "enterprises", "users", column: "updated_by"
  add_foreign_key "entities", "geo_cities"
  add_foreign_key "entities", "geo_countries"
  add_foreign_key "entities", "geo_states"
  add_foreign_key "entities", "subtypes", column: "institution_type_id"
  add_foreign_key "entities", "subtypes", column: "legal_nature_id"
  add_foreign_key "entities", "users", column: "created_by"
  add_foreign_key "entities", "users", column: "updated_by"
  add_foreign_key "events", "colciencias_calls"
  add_foreign_key "events", "geo_cities"
  add_foreign_key "events", "geo_countries"
  add_foreign_key "events", "geo_states"
  add_foreign_key "events", "research_groups"
  add_foreign_key "events", "subtypes", column: "category_id"
  add_foreign_key "events", "subtypes", column: "eve_type_id"
  add_foreign_key "events", "subtypes", column: "participation_id"
  add_foreign_key "events", "users", column: "created_by"
  add_foreign_key "events", "users", column: "updated_by"
  add_foreign_key "ext_participants", "subtypes", column: "participant_type_id"
  add_foreign_key "ext_participants", "users", column: "created_by"
  add_foreign_key "ext_participants", "users", column: "updated_by"
  add_foreign_key "extension_projects", "colciencias_calls"
  add_foreign_key "extension_projects", "geo_cities"
  add_foreign_key "extension_projects", "geo_countries"
  add_foreign_key "extension_projects", "geo_states"
  add_foreign_key "extension_projects", "research_groups"
  add_foreign_key "extension_projects", "subtypes", column: "category_id"
  add_foreign_key "extension_projects", "users", column: "created_by"
  add_foreign_key "extension_projects", "users", column: "updated_by"
  add_foreign_key "faculty_ids_research_groups", "research_groups"
  add_foreign_key "faculty_ids_research_groups", "users", column: "created_by"
  add_foreign_key "faculty_ids_research_groups", "users", column: "updated_by"
  add_foreign_key "faculty_ids_research_networks", "research_networks"
  add_foreign_key "faculty_ids_research_networks", "users", column: "created_by"
  add_foreign_key "faculty_ids_research_networks", "users", column: "updated_by"
  add_foreign_key "form_a_act_plans", "action_plans"
  add_foreign_key "form_a_act_plans", "indicators"
  add_foreign_key "form_a_act_plans", "subtypes", column: "plan_type_id"
  add_foreign_key "form_a_act_plans", "subtypes", column: "product_type_id"
  add_foreign_key "form_a_act_plans", "users", column: "created_by"
  add_foreign_key "form_a_act_plans", "users", column: "updated_by"
  add_foreign_key "form_b_act_plans", "action_plans"
  add_foreign_key "form_b_act_plans", "subtypes", column: "financing_type_id"
  add_foreign_key "form_b_act_plans", "subtypes", column: "goal_state_id"
  add_foreign_key "form_b_act_plans", "subtypes", column: "plan_type_id"
  add_foreign_key "form_b_act_plans", "users", column: "created_by"
  add_foreign_key "form_b_act_plans", "users", column: "updated_by"
  add_foreign_key "form_c_act_plans", "action_plans"
  add_foreign_key "form_c_act_plans", "subtypes", column: "child_prod_type_id"
  add_foreign_key "form_c_act_plans", "subtypes", column: "plan_type_id"
  add_foreign_key "form_c_act_plans", "subtypes", column: "product_type_id"
  add_foreign_key "form_c_act_plans", "users", column: "created_by"
  add_foreign_key "form_c_act_plans", "users", column: "updated_by"
  add_foreign_key "form_d_act_plans", "action_plans"
  add_foreign_key "form_d_act_plans", "subtypes", column: "goal_state_id"
  add_foreign_key "form_d_act_plans", "subtypes", column: "plan_type_id"
  add_foreign_key "form_d_act_plans", "users", column: "created_by"
  add_foreign_key "form_d_act_plans", "users", column: "updated_by"
  add_foreign_key "form_e_act_plans", "action_plans"
  add_foreign_key "form_e_act_plans", "subtypes", column: "classification_id"
  add_foreign_key "form_e_act_plans", "users", column: "created_by"
  add_foreign_key "form_e_act_plans", "users", column: "updated_by"
  add_foreign_key "functional_applications", "procedure_requests"
  add_foreign_key "functional_applications", "users", column: "created_by"
  add_foreign_key "functional_applications", "users", column: "updated_by"
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
  add_foreign_key "guide_manuals", "colciencias_calls"
  add_foreign_key "guide_manuals", "geo_cities"
  add_foreign_key "guide_manuals", "geo_countries"
  add_foreign_key "guide_manuals", "geo_states"
  add_foreign_key "guide_manuals", "research_groups"
  add_foreign_key "guide_manuals", "subtypes", column: "category_id"
  add_foreign_key "guide_manuals", "subtypes", column: "product_type_id"
  add_foreign_key "guide_manuals", "users", column: "created_by"
  add_foreign_key "guide_manuals", "users", column: "updated_by"
  add_foreign_key "hist_contacts", "contacts"
  add_foreign_key "hist_contacts", "dependencies"
  add_foreign_key "hist_contacts", "users", column: "created_by"
  add_foreign_key "hist_contacts", "users", column: "updated_by"
  add_foreign_key "hist_legal_representatives", "entities"
  add_foreign_key "hist_legal_representatives", "legal_representatives"
  add_foreign_key "hist_legal_representatives", "users", column: "created_by"
  add_foreign_key "hist_legal_representatives", "users", column: "updated_by"
  add_foreign_key "historical_colciencias_ranks", "oecd_knowledge_areas"
  add_foreign_key "historical_colciencias_ranks", "oecd_knowledge_subareas"
  add_foreign_key "historical_colciencias_ranks", "users", column: "created_by"
  add_foreign_key "historical_colciencias_ranks", "users", column: "updated_by"
  add_foreign_key "idi_investigation_projects", "colciencias_calls"
  add_foreign_key "idi_investigation_projects", "geo_cities"
  add_foreign_key "idi_investigation_projects", "geo_countries"
  add_foreign_key "idi_investigation_projects", "geo_states"
  add_foreign_key "idi_investigation_projects", "research_groups"
  add_foreign_key "idi_investigation_projects", "subtypes", column: "category_id"
  add_foreign_key "idi_investigation_projects", "users", column: "created_by"
  add_foreign_key "idi_investigation_projects", "users", column: "updated_by"
  add_foreign_key "indicators", "subtypes"
  add_foreign_key "indicators", "users", column: "created_by"
  add_foreign_key "indicators", "users", column: "updated_by"
  add_foreign_key "industrial_designs", "colciencias_calls"
  add_foreign_key "industrial_designs", "geo_cities"
  add_foreign_key "industrial_designs", "geo_countries"
  add_foreign_key "industrial_designs", "geo_states"
  add_foreign_key "industrial_designs", "research_groups"
  add_foreign_key "industrial_designs", "subtypes", column: "category_id"
  add_foreign_key "industrial_designs", "users", column: "created_by"
  add_foreign_key "industrial_designs", "users", column: "updated_by"
  add_foreign_key "informative_bulletins", "colciencias_calls"
  add_foreign_key "informative_bulletins", "geo_cities"
  add_foreign_key "informative_bulletins", "geo_countries"
  add_foreign_key "informative_bulletins", "geo_states"
  add_foreign_key "informative_bulletins", "research_groups"
  add_foreign_key "informative_bulletins", "subtypes", column: "category_id"
  add_foreign_key "informative_bulletins", "users", column: "created_by"
  add_foreign_key "informative_bulletins", "users", column: "updated_by"
  add_foreign_key "innovations", "colciencias_calls"
  add_foreign_key "innovations", "geo_cities"
  add_foreign_key "innovations", "geo_countries"
  add_foreign_key "innovations", "geo_states"
  add_foreign_key "innovations", "research_groups"
  add_foreign_key "innovations", "subtypes", column: "category_id"
  add_foreign_key "innovations", "subtypes", column: "product_type_id"
  add_foreign_key "innovations", "users", column: "created_by"
  add_foreign_key "innovations", "users", column: "updated_by"
  add_foreign_key "int_participants", "researchers"
  add_foreign_key "int_participants", "subtypes", column: "participant_type_id"
  add_foreign_key "int_participants", "users", column: "created_by"
  add_foreign_key "int_participants", "users", column: "updated_by"
  add_foreign_key "integrated_circuit_diagrams", "colciencias_calls"
  add_foreign_key "integrated_circuit_diagrams", "geo_cities"
  add_foreign_key "integrated_circuit_diagrams", "geo_countries"
  add_foreign_key "integrated_circuit_diagrams", "geo_states"
  add_foreign_key "integrated_circuit_diagrams", "research_groups"
  add_foreign_key "integrated_circuit_diagrams", "subtypes", column: "category_id"
  add_foreign_key "integrated_circuit_diagrams", "users", column: "created_by"
  add_foreign_key "integrated_circuit_diagrams", "users", column: "updated_by"
  add_foreign_key "investigation_projects", "colciencias_calls"
  add_foreign_key "investigation_projects", "geo_cities"
  add_foreign_key "investigation_projects", "geo_countries"
  add_foreign_key "investigation_projects", "geo_states"
  add_foreign_key "investigation_projects", "research_groups"
  add_foreign_key "investigation_projects", "subtypes", column: "category_id"
  add_foreign_key "investigation_projects", "subtypes", column: "product_type_id"
  add_foreign_key "investigation_projects", "users", column: "created_by"
  add_foreign_key "investigation_projects", "users", column: "updated_by"
  add_foreign_key "ip_livestock_breeds", "colciencias_calls"
  add_foreign_key "ip_livestock_breeds", "geo_cities"
  add_foreign_key "ip_livestock_breeds", "geo_countries"
  add_foreign_key "ip_livestock_breeds", "geo_states"
  add_foreign_key "ip_livestock_breeds", "research_groups"
  add_foreign_key "ip_livestock_breeds", "subtypes", column: "category_id"
  add_foreign_key "ip_livestock_breeds", "users", column: "created_by"
  add_foreign_key "ip_livestock_breeds", "users", column: "updated_by"
  add_foreign_key "knowledge_networks", "colciencias_calls"
  add_foreign_key "knowledge_networks", "geo_cities"
  add_foreign_key "knowledge_networks", "geo_countries"
  add_foreign_key "knowledge_networks", "geo_states"
  add_foreign_key "knowledge_networks", "research_groups"
  add_foreign_key "knowledge_networks", "subtypes", column: "category_id"
  add_foreign_key "knowledge_networks", "users", column: "created_by"
  add_foreign_key "knowledge_networks", "users", column: "updated_by"
  add_foreign_key "legal_representatives", "subtypes", column: "identification_type_id"
  add_foreign_key "legal_representatives", "users", column: "created_by"
  add_foreign_key "legal_representatives", "users", column: "updated_by"
  add_foreign_key "license_agreements", "colciencias_calls"
  add_foreign_key "license_agreements", "geo_cities"
  add_foreign_key "license_agreements", "geo_cities", column: "contract_geo_city_id"
  add_foreign_key "license_agreements", "geo_countries"
  add_foreign_key "license_agreements", "geo_countries", column: "contract_geo_country_id"
  add_foreign_key "license_agreements", "geo_states"
  add_foreign_key "license_agreements", "geo_states", column: "contract_geo_state_id"
  add_foreign_key "license_agreements", "research_groups"
  add_foreign_key "license_agreements", "subtypes", column: "category_id"
  add_foreign_key "license_agreements", "users", column: "created_by"
  add_foreign_key "license_agreements", "users", column: "updated_by"
  add_foreign_key "magazine_editions", "colciencias_calls"
  add_foreign_key "magazine_editions", "geo_cities"
  add_foreign_key "magazine_editions", "geo_countries"
  add_foreign_key "magazine_editions", "geo_states"
  add_foreign_key "magazine_editions", "research_groups"
  add_foreign_key "magazine_editions", "subtypes", column: "category_id"
  add_foreign_key "magazine_editions", "users", column: "created_by"
  add_foreign_key "magazine_editions", "users", column: "updated_by"
  add_foreign_key "new_animal_breeds", "colciencias_calls"
  add_foreign_key "new_animal_breeds", "geo_cities"
  add_foreign_key "new_animal_breeds", "geo_countries"
  add_foreign_key "new_animal_breeds", "geo_states"
  add_foreign_key "new_animal_breeds", "research_groups"
  add_foreign_key "new_animal_breeds", "subtypes", column: "petition_status_id"
  add_foreign_key "new_animal_breeds", "users", column: "created_by"
  add_foreign_key "new_animal_breeds", "users", column: "updated_by"
  add_foreign_key "new_genetic_sequences", "colciencias_calls"
  add_foreign_key "new_genetic_sequences", "geo_cities"
  add_foreign_key "new_genetic_sequences", "geo_countries"
  add_foreign_key "new_genetic_sequences", "geo_states"
  add_foreign_key "new_genetic_sequences", "research_groups"
  add_foreign_key "new_genetic_sequences", "subtypes", column: "category_id"
  add_foreign_key "new_genetic_sequences", "users", column: "created_by"
  add_foreign_key "new_genetic_sequences", "users", column: "updated_by"
  add_foreign_key "new_scientific_records", "colciencias_calls"
  add_foreign_key "new_scientific_records", "geo_cities"
  add_foreign_key "new_scientific_records", "geo_countries"
  add_foreign_key "new_scientific_records", "geo_states"
  add_foreign_key "new_scientific_records", "research_groups"
  add_foreign_key "new_scientific_records", "subtypes", column: "category_id"
  add_foreign_key "new_scientific_records", "users", column: "created_by"
  add_foreign_key "new_scientific_records", "users", column: "updated_by"
  add_foreign_key "next_tasks", "task_models", column: "actual_task_id"
  add_foreign_key "next_tasks", "task_models", column: "following_task_id"
  add_foreign_key "next_tasks", "users", column: "created_by"
  add_foreign_key "next_tasks", "users", column: "updated_by"
  add_foreign_key "nutraceutical_products", "colciencias_calls"
  add_foreign_key "nutraceutical_products", "geo_cities"
  add_foreign_key "nutraceutical_products", "geo_countries"
  add_foreign_key "nutraceutical_products", "geo_states"
  add_foreign_key "nutraceutical_products", "research_groups"
  add_foreign_key "nutraceutical_products", "subtypes", column: "category_id"
  add_foreign_key "nutraceutical_products", "users", column: "created_by"
  add_foreign_key "nutraceutical_products", "users", column: "updated_by"
  add_foreign_key "oecd_disciplines", "oecd_knowledge_subareas"
  add_foreign_key "oecd_disciplines", "users", column: "created_by"
  add_foreign_key "oecd_disciplines", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_areas", "users", column: "updated_by"
  add_foreign_key "oecd_knowledge_subareas", "oecd_knowledge_areas"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "created_by"
  add_foreign_key "oecd_knowledge_subareas", "users", column: "updated_by"
  add_foreign_key "otri_professionals", "professional_roles"
  add_foreign_key "otri_professionals", "users"
  add_foreign_key "otri_professionals", "users", column: "created_by"
  add_foreign_key "otri_professionals", "users", column: "updated_by"
  add_foreign_key "papers", "colciencias_calls"
  add_foreign_key "papers", "geo_cities"
  add_foreign_key "papers", "geo_countries"
  add_foreign_key "papers", "geo_states"
  add_foreign_key "papers", "research_groups"
  add_foreign_key "papers", "subtypes", column: "category_id"
  add_foreign_key "papers", "subtypes", column: "paper_type_id"
  add_foreign_key "papers", "users", column: "created_by"
  add_foreign_key "papers", "users", column: "updated_by"
  add_foreign_key "patents", "colciencias_calls"
  add_foreign_key "patents", "research_groups"
  add_foreign_key "patents", "subtypes", column: "category_id"
  add_foreign_key "patents", "subtypes", column: "patent_state_id"
  add_foreign_key "patents", "subtypes", column: "patent_type_id"
  add_foreign_key "patents", "users", column: "created_by"
  add_foreign_key "patents", "users", column: "updated_by"
  add_foreign_key "plant_ind_prototypes", "colciencias_calls"
  add_foreign_key "plant_ind_prototypes", "geo_cities"
  add_foreign_key "plant_ind_prototypes", "geo_countries"
  add_foreign_key "plant_ind_prototypes", "geo_states"
  add_foreign_key "plant_ind_prototypes", "research_groups"
  add_foreign_key "plant_ind_prototypes", "subtypes", column: "category_id"
  add_foreign_key "plant_ind_prototypes", "subtypes", column: "plt_type_id"
  add_foreign_key "plant_ind_prototypes", "users", column: "created_by"
  add_foreign_key "plant_ind_prototypes", "users", column: "updated_by"
  add_foreign_key "potential_markets", "procedure_requests"
  add_foreign_key "potential_markets", "subtypes", column: "market_participation_id"
  add_foreign_key "potential_markets", "subtypes", column: "success_rank_id"
  add_foreign_key "potential_markets", "users", column: "created_by"
  add_foreign_key "potential_markets", "users", column: "updated_by"
  add_foreign_key "procedure_requests", "users", column: "created_by"
  add_foreign_key "procedure_requests", "users", column: "updated_by"
  add_foreign_key "procedures", "users", column: "created_by"
  add_foreign_key "procedures", "users", column: "updated_by"
  add_foreign_key "professional_roles", "users", column: "created_by"
  add_foreign_key "professional_roles", "users", column: "updated_by"
  add_foreign_key "proposals", "calls"
  add_foreign_key "proposals", "geo_cities"
  add_foreign_key "proposals", "geo_countries"
  add_foreign_key "proposals", "geo_states"
  add_foreign_key "proposals", "subtypes", column: "project_type_id"
  add_foreign_key "proposals", "subtypes", column: "proposal_status_id"
  add_foreign_key "proposals", "users", column: "created_by"
  add_foreign_key "proposals", "users", column: "updated_by"
  add_foreign_key "protocol_acts", "colciencias_calls"
  add_foreign_key "protocol_acts", "geo_cities"
  add_foreign_key "protocol_acts", "geo_countries"
  add_foreign_key "protocol_acts", "geo_states"
  add_foreign_key "protocol_acts", "research_groups"
  add_foreign_key "protocol_acts", "subtypes", column: "category_id"
  add_foreign_key "protocol_acts", "subtypes", column: "product_type_id"
  add_foreign_key "protocol_acts", "users", column: "created_by"
  add_foreign_key "protocol_acts", "users", column: "updated_by"
  add_foreign_key "publications", "colciencias_calls"
  add_foreign_key "publications", "geo_cities"
  add_foreign_key "publications", "geo_countries"
  add_foreign_key "publications", "geo_states"
  add_foreign_key "publications", "research_groups"
  add_foreign_key "publications", "subtypes", column: "category_id"
  add_foreign_key "publications", "subtypes", column: "duration_type_id"
  add_foreign_key "publications", "subtypes", column: "product_type_id"
  add_foreign_key "publications", "users", column: "created_by"
  add_foreign_key "publications", "users", column: "updated_by"
  add_foreign_key "read_attributes", "task_attributes"
  add_foreign_key "read_attributes", "task_models"
  add_foreign_key "read_attributes", "users", column: "created_by"
  add_foreign_key "read_attributes", "users", column: "updated_by"
  add_foreign_key "regulations", "colciencias_calls"
  add_foreign_key "regulations", "geo_cities"
  add_foreign_key "regulations", "geo_countries"
  add_foreign_key "regulations", "geo_states"
  add_foreign_key "regulations", "research_groups"
  add_foreign_key "regulations", "subtypes", column: "category_id"
  add_foreign_key "regulations", "subtypes", column: "product_type_id"
  add_foreign_key "regulations", "subtypes", column: "regulation_type_id"
  add_foreign_key "regulations", "users", column: "created_by"
  add_foreign_key "regulations", "users", column: "updated_by"
  add_foreign_key "reports", "colciencias_calls"
  add_foreign_key "reports", "geo_cities"
  add_foreign_key "reports", "geo_countries"
  add_foreign_key "reports", "geo_states"
  add_foreign_key "reports", "research_groups"
  add_foreign_key "reports", "subtypes", column: "category_id"
  add_foreign_key "reports", "subtypes", column: "product_type_id"
  add_foreign_key "reports", "users", column: "created_by"
  add_foreign_key "reports", "users", column: "updated_by"
  add_foreign_key "request_has_application_areas", "procedure_requests"
  add_foreign_key "request_has_application_areas", "subtypes", column: "application_area_id"
  add_foreign_key "request_has_application_areas", "users", column: "created_by"
  add_foreign_key "request_has_application_areas", "users", column: "updated_by"
  add_foreign_key "request_has_procedures", "procedure_requests"
  add_foreign_key "request_has_procedures", "procedures"
  add_foreign_key "request_has_procedures", "users", column: "created_by"
  add_foreign_key "request_has_procedures", "users", column: "updated_by"
  add_foreign_key "research_creation_works", "colciencias_calls"
  add_foreign_key "research_creation_works", "geo_cities"
  add_foreign_key "research_creation_works", "geo_countries"
  add_foreign_key "research_creation_works", "geo_states"
  add_foreign_key "research_creation_works", "research_groups"
  add_foreign_key "research_creation_works", "subtypes", column: "category_id"
  add_foreign_key "research_creation_works", "subtypes", column: "knwl_spec_area_id"
  add_foreign_key "research_creation_works", "subtypes", column: "nature_id"
  add_foreign_key "research_creation_works", "users", column: "created_by"
  add_foreign_key "research_creation_works", "users", column: "updated_by"
  add_foreign_key "research_groups", "cine_broad_areas"
  add_foreign_key "research_groups", "cine_specific_areas"
  add_foreign_key "research_groups", "oecd_knowledge_areas"
  add_foreign_key "research_groups", "oecd_knowledge_subareas"
  add_foreign_key "research_groups", "research_groups", column: "parent_id"
  add_foreign_key "research_groups", "subtypes", column: "group_state_id"
  add_foreign_key "research_groups", "subtypes", column: "group_type_id"
  add_foreign_key "research_groups", "subtypes", column: "snies_id"
  add_foreign_key "research_groups", "users", column: "created_by"
  add_foreign_key "research_groups", "users", column: "updated_by"
  add_foreign_key "research_groups_research_networks", "research_groups"
  add_foreign_key "research_groups_research_networks", "research_networks"
  add_foreign_key "research_groups_research_networks", "users", column: "created_by"
  add_foreign_key "research_groups_research_networks", "users", column: "updated_by"
  add_foreign_key "research_networks", "cine_broad_areas"
  add_foreign_key "research_networks", "cine_specific_areas"
  add_foreign_key "research_networks", "oecd_knowledge_areas"
  add_foreign_key "research_networks", "oecd_knowledge_subareas"
  add_foreign_key "research_networks", "research_groups", column: "main_research_group_id"
  add_foreign_key "research_networks", "researchers"
  add_foreign_key "research_networks", "subtypes", column: "network_type_id"
  add_foreign_key "research_networks", "subtypes", column: "snies_id"
  add_foreign_key "research_networks", "users", column: "created_by"
  add_foreign_key "research_networks", "users", column: "updated_by"
  add_foreign_key "researchers", "users", column: "created_by"
  add_foreign_key "researchers", "users", column: "identification_number", primary_key: "identification_number", on_delete: :cascade
  add_foreign_key "researchers", "users", column: "updated_by"
  add_foreign_key "roles", "users", column: "created_by"
  add_foreign_key "roles", "users", column: "updated_by"
  add_foreign_key "schedule_activities", "calls"
  add_foreign_key "schedule_activities", "users", column: "created_by"
  add_foreign_key "schedule_activities", "users", column: "updated_by"
  add_foreign_key "scientific_collections", "colciencias_calls"
  add_foreign_key "scientific_collections", "geo_cities"
  add_foreign_key "scientific_collections", "geo_countries"
  add_foreign_key "scientific_collections", "geo_states"
  add_foreign_key "scientific_collections", "research_groups"
  add_foreign_key "scientific_collections", "subtypes", column: "category_id"
  add_foreign_key "scientific_collections", "users", column: "created_by"
  add_foreign_key "scientific_collections", "users", column: "updated_by"
  add_foreign_key "scientific_notes", "colciencias_calls"
  add_foreign_key "scientific_notes", "geo_cities"
  add_foreign_key "scientific_notes", "geo_countries"
  add_foreign_key "scientific_notes", "geo_states"
  add_foreign_key "scientific_notes", "research_groups"
  add_foreign_key "scientific_notes", "subtypes", column: "category_id"
  add_foreign_key "scientific_notes", "users", column: "created_by"
  add_foreign_key "scientific_notes", "users", column: "updated_by"
  add_foreign_key "simple_books", "colciencias_calls"
  add_foreign_key "simple_books", "geo_cities"
  add_foreign_key "simple_books", "geo_countries"
  add_foreign_key "simple_books", "geo_states"
  add_foreign_key "simple_books", "research_groups"
  add_foreign_key "simple_books", "subtypes", column: "category_id"
  add_foreign_key "simple_books", "subtypes", column: "product_type_id"
  add_foreign_key "simple_books", "users", column: "created_by"
  add_foreign_key "simple_books", "users", column: "updated_by"
  add_foreign_key "software", "colciencias_calls"
  add_foreign_key "software", "geo_cities"
  add_foreign_key "software", "geo_countries"
  add_foreign_key "software", "geo_states"
  add_foreign_key "software", "research_groups"
  add_foreign_key "software", "subtypes", column: "category_id"
  add_foreign_key "software", "users", column: "created_by"
  add_foreign_key "software", "users", column: "updated_by"
  add_foreign_key "subtypes", "subtypes", column: "parent_id"
  add_foreign_key "subtypes", "types"
  add_foreign_key "subtypes", "users", column: "created_by"
  add_foreign_key "subtypes", "users", column: "updated_by"
  add_foreign_key "task_attributes", "subtypes", column: "attribute_sub_type_id"
  add_foreign_key "task_attributes", "task_models"
  add_foreign_key "task_attributes", "users", column: "created_by"
  add_foreign_key "task_attributes", "users", column: "updated_by"
  add_foreign_key "task_has_states", "subtypes", column: "state_id"
  add_foreign_key "task_has_states", "tasks"
  add_foreign_key "task_has_states", "users", column: "created_by"
  add_foreign_key "task_has_states", "users", column: "updated_by"
  add_foreign_key "task_models", "procedures"
  add_foreign_key "task_models", "professional_roles"
  add_foreign_key "task_models", "users", column: "created_by"
  add_foreign_key "task_models", "users", column: "updated_by"
  add_foreign_key "tasks", "otri_professionals"
  add_foreign_key "tasks", "request_has_procedures"
  add_foreign_key "tasks", "subtypes", column: "intelectual_property_id"
  add_foreign_key "tasks", "task_models"
  add_foreign_key "tasks", "users", column: "created_by"
  add_foreign_key "tasks", "users", column: "updated_by"
  add_foreign_key "technical_concepts", "colciencias_calls"
  add_foreign_key "technical_concepts", "geo_cities"
  add_foreign_key "technical_concepts", "geo_countries"
  add_foreign_key "technical_concepts", "geo_states"
  add_foreign_key "technical_concepts", "research_groups"
  add_foreign_key "technical_concepts", "subtypes", column: "category_id"
  add_foreign_key "technical_concepts", "users", column: "created_by"
  add_foreign_key "technical_concepts", "users", column: "updated_by"
  add_foreign_key "technological_situations", "procedure_requests"
  add_foreign_key "technological_situations", "subtypes", column: "invention_type_id"
  add_foreign_key "technological_situations", "users", column: "created_by"
  add_foreign_key "technological_situations", "users", column: "updated_by"
  add_foreign_key "technology_descriptions", "procedure_requests"
  add_foreign_key "technology_descriptions", "users", column: "created_by"
  add_foreign_key "technology_descriptions", "users", column: "updated_by"
  add_foreign_key "training_courses", "colciencias_calls"
  add_foreign_key "training_courses", "geo_cities"
  add_foreign_key "training_courses", "geo_countries"
  add_foreign_key "training_courses", "geo_states"
  add_foreign_key "training_courses", "research_groups"
  add_foreign_key "training_courses", "subtypes", column: "category_id"
  add_foreign_key "training_courses", "users", column: "created_by"
  add_foreign_key "training_courses", "users", column: "updated_by"
  add_foreign_key "types", "users", column: "created_by"
  add_foreign_key "types", "users", column: "updated_by"
  add_foreign_key "user_roles", "users", column: "created_by"
  add_foreign_key "user_roles", "users", column: "updated_by"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "users", column: "created_by"
  add_foreign_key "users", "users", column: "updated_by"
  add_foreign_key "vegetable_varieties", "colciencias_calls"
  add_foreign_key "vegetable_varieties", "geo_cities"
  add_foreign_key "vegetable_varieties", "geo_countries"
  add_foreign_key "vegetable_varieties", "geo_states"
  add_foreign_key "vegetable_varieties", "research_groups"
  add_foreign_key "vegetable_varieties", "subtypes", column: "category_id"
  add_foreign_key "vegetable_varieties", "subtypes", column: "cycle_type_id"
  add_foreign_key "vegetable_varieties", "subtypes", column: "petition_status_id"
  add_foreign_key "vegetable_varieties", "users", column: "created_by"
  add_foreign_key "vegetable_varieties", "users", column: "updated_by"
  add_foreign_key "working_papers", "colciencias_calls"
  add_foreign_key "working_papers", "research_groups"
  add_foreign_key "working_papers", "subtypes", column: "category_id"
  add_foreign_key "working_papers", "users", column: "created_by"
  add_foreign_key "working_papers", "users", column: "updated_by"

  create_view "siciud.complete_accompaniment_consultancies", sql_definition: <<-SQL
      SELECT ac.id,
      ac.category_id,
      st.st_name AS category_name,
      ac.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ac.date,
      ac.geo_city_id,
      gcity.name AS geo_city_name,
      ac.geo_country_id,
      gctry.name AS geo_country_name,
      ac.geo_state_id,
      gs.name AS geo_state_name,
      ac.institution,
      ac.observation,
      ac.project_name,
      ac.active,
      ac.research_group_id,
      ac.created_by,
      ac.updated_by,
      ac.created_at,
      ac.updated_at
     FROM (((((accompaniment_consultancies ac
       LEFT JOIN subtypes st ON ((ac.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ac.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ac.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ac.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ac.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_appropriation_processes", sql_definition: <<-SQL
      SELECT ap.id,
      ap.name,
      ap.category_id,
      st.st_name AS category_name,
      ap.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ap.funding_institution,
      ap.start_date,
      ap.finish_date,
      ap.observation,
      ap.product_type_id,
      pt.st_name AS product_type_name,
      ap.research_group_id,
      ap.research_project_title,
      ap.active,
      ap.created_by,
      ap.updated_by,
      ap.created_at,
      ap.updated_at
     FROM (((appropriation_processes ap
       LEFT JOIN subtypes st ON ((ap.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ap.colciencias_call_id = cc.id)))
       LEFT JOIN subtypes pt ON ((ap.product_type_id = pt.id)));
  SQL
  create_view "siciud.complete_bills", sql_definition: <<-SQL
      SELECT bl.id,
      bl.title,
      bl.category_id,
      st.st_name AS category_name,
      bl.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      bl.observation,
      bl.research_group_id,
      bl.active,
      bl.created_by,
      bl.updated_by,
      bl.created_at,
      bl.updated_at
     FROM ((bills bl
       LEFT JOIN subtypes st ON ((bl.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((bl.colciencias_call_id = cc.id)));
  SQL
  create_view "siciud.complete_book_chapters", sql_definition: <<-SQL
      SELECT bc.id,
      bc.book_title,
      bc.title,
      bc.category_id,
      st.st_name AS category_name,
      bc.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      bc.doi,
      bc.editorial_name,
      bc.geo_city_id,
      gcity.name AS geo_city_name,
      bc.geo_country_id,
      gctry.name AS geo_country_name,
      bc.geo_state_id,
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
       LEFT JOIN subtypes st ON ((bc.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((bc.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((bc.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((bc.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((bc.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_books", sql_definition: <<-SQL
      SELECT b.id,
      b.title,
      b.book_type_id,
      tbk.st_name AS book_type_name,
      b.category_id,
      st.st_name AS category_name,
      b.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      b.editorial_name,
      b.geo_city_id,
      gcity.name AS geo_city_name,
      b.geo_country_id,
      gctry.name AS geo_country_name,
      b.geo_state_id,
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
       LEFT JOIN subtypes tbk ON ((b.book_type_id = tbk.id)))
       LEFT JOIN colciencias_calls cc ON ((b.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((b.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((b.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((b.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_clinical_pgs", sql_definition: <<-SQL
      SELECT cpg.id,
      cpg.title,
      cpg.category_id,
      st.st_name AS category_name,
      cpg.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      cpg.date_of_publication,
      cpg.geo_city_id,
      gcity.name AS geo_city_name,
      cpg.geo_country_id,
      gctry.name AS geo_country_name,
      cpg.geo_state_id,
      gs.name AS geo_state_name,
      cpg.isbn,
      cpg.observation,
      cpg.research_group_id,
      cpg.active,
      cpg.created_by,
      cpg.updated_by,
      cpg.created_at,
      cpg.updated_at
     FROM (((((clinical_practice_guidelines cpg
       LEFT JOIN subtypes st ON ((cpg.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((cpg.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((cpg.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((cpg.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((cpg.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_consultancies", sql_definition: <<-SQL
      SELECT cns.id,
      cns.title,
      cns.category_id,
      st.st_name AS category_name,
      cns.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      cns.consultation_date,
      cns.consulting_objective,
      cns.contract_number,
      cns.geo_city_id,
      gcity.name AS geo_city_name,
      cns.geo_country_id,
      gctry.name AS geo_country_name,
      cns.geo_state_id,
      gs.name AS geo_state_name,
      cns.observation,
      cns.product_type_id,
      pdt.st_name AS product_type_name,
      cns.research_group_id,
      cns.active,
      cns.created_by,
      cns.updated_by,
      cns.created_at,
      cns.updated_at
     FROM ((((((consultancies cns
       LEFT JOIN subtypes st ON ((cns.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((cns.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((cns.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((cns.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((cns.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pdt ON ((cns.product_type_id = pdt.id)));
  SQL
  create_view "siciud.complete_content_generations", sql_definition: <<-SQL
      SELECT cg.id,
      cg.bibliographic_reference,
      cg.category_id,
      st.st_name AS category_name,
      cg.doi,
      cg.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      cg.final_page,
      cg.generation_date,
      cg.geo_city_id,
      gcity.name AS geo_city_name,
      cg.geo_country_id,
      gctry.name AS geo_country_name,
      cg.geo_state_id,
      gs.name AS geo_state_name,
      cg.isbn,
      cg.magazine_name,
      cg.pages_number,
      cg.observation,
      cg.product_type_id,
      pst.st_name AS product_type_name,
      cg.start_page,
      cg.title,
      cg.volume,
      cg.web_page,
      cg.active,
      cg.research_group_id,
      cg.created_by,
      cg.updated_by,
      cg.created_at,
      cg.updated_at
     FROM ((((((content_generations cg
       LEFT JOIN subtypes st ON ((cg.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((cg.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((cg.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((cg.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((cg.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pst ON ((cg.product_type_id = pst.id)));
  SQL
  create_view "siciud.complete_creation_workshops", sql_definition: <<-SQL
      SELECT cw.id,
      cw.name,
      cw.category_id,
      st.st_name AS category_name,
      cw.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      cw.funding_institution,
      cw.geo_city_id,
      gcity.name AS geo_city_name,
      cw.geo_country_id,
      gctry.name AS geo_country_name,
      cw.geo_state_id,
      gs.name AS geo_state_name,
      cw.start_date,
      cw.finish_date,
      cw.observation,
      cw.organization_name,
      cw.participation_id,
      prst.st_name AS participation_name,
      cw.research_group_id,
      cw.active,
      cw.created_by,
      cw.updated_by,
      cw.created_at,
      cw.updated_at
     FROM ((((((creation_workshops cw
       LEFT JOIN subtypes st ON ((cw.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((cw.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((cw.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((cw.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((cw.geo_country_id = gctry.id)))
       LEFT JOIN subtypes prst ON ((cw.participation_id = prst.id)));
  SQL
  create_view "siciud.complete_degree_works", sql_definition: <<-SQL
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
  create_view "siciud.complete_distinctive_signs", sql_definition: <<-SQL
      SELECT ds.id,
      ds.registration_title,
      ds.category_id,
      st.st_name AS category_name,
      ds.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ds.date_of_obtaining,
      ds.geo_city_id,
      gcity.name AS geo_city_name,
      ds.geo_country_id,
      gctry.name AS geo_country_name,
      ds.geo_state_id,
      gs.name AS geo_state_name,
      ds.observation,
      ds.registration_number,
      ds.research_group_id,
      ds.active,
      ds.created_by,
      ds.updated_by,
      ds.created_at,
      ds.updated_at
     FROM (((((distinctive_signs ds
       LEFT JOIN subtypes st ON ((ds.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ds.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ds.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ds.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ds.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_documents", sql_definition: <<-SQL
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
  create_view "siciud.complete_enterprise_secrets", sql_definition: <<-SQL
      SELECT ens.id,
      ens.name,
      ens.category_id,
      st.st_name AS category_name,
      ens.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ens.contract_number,
      ens.contract_value,
      ens.date_of_obtaining,
      ens.geo_city_id,
      gcity.name AS geo_city_name,
      ens.geo_country_id,
      gctry.name AS geo_country_name,
      ens.geo_state_id,
      gs.name AS geo_state_name,
      ens.observation,
      ens.research_group_id,
      ens.active,
      ens.created_by,
      ens.updated_by,
      ens.created_at,
      ens.updated_at
     FROM (((((enterprise_secrets ens
       LEFT JOIN subtypes st ON ((ens.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ens.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ens.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ens.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ens.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_enterprises", sql_definition: <<-SQL
      SELECT ent.id,
      ent.name,
      ent.category_id,
      st.st_name AS category_name,
      ent.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ent.comercial_name,
      ent.date_of_obtaining,
      ent.geo_city_id,
      gcity.name AS geo_city_name,
      ent.geo_country_id,
      gctry.name AS geo_country_name,
      ent.geo_state_id,
      gs.name AS geo_state_name,
      ent.nit,
      ent.observation,
      ent.product_type_id,
      pt.st_name AS product_type_name,
      ent.research_group_id,
      ent.active,
      ent.created_by,
      ent.updated_by,
      ent.created_at,
      ent.updated_at
     FROM ((((((enterprises ent
       LEFT JOIN subtypes st ON ((ent.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ent.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ent.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ent.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ent.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pt ON ((ent.product_type_id = pt.id)));
  SQL
  create_view "siciud.complete_events", sql_definition: <<-SQL
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
      eve.geo_city_id,
      gcity.name AS geo_city_name,
      eve.geo_country_id,
      gctry.name AS geo_country_name,
      eve.geo_state_id,
      gs.name AS geo_state_name,
      eve.participation_id,
      part.st_name AS participation_name,
      eve.research_group_id,
      eve.active,
      eve.created_by,
      eve.updated_by,
      eve.created_at,
      eve.updated_at
     FROM (((((((events eve
       LEFT JOIN subtypes st ON ((eve.category_id = st.id)))
       LEFT JOIN subtypes evt ON ((eve.eve_type_id = evt.id)))
       LEFT JOIN subtypes part ON ((eve.participation_id = part.id)))
       LEFT JOIN colciencias_calls cc ON ((eve.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((eve.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((eve.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((eve.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_ext_participants", sql_definition: <<-SQL
      SELECT extp.id,
      extp.producible_type AS product_type,
      extp.producible_id AS product_type_id,
      extp.first_name,
      extp.last_name,
      extp.orcid_id,
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
  create_view "siciud.complete_extension_projects", sql_definition: <<-SQL
      SELECT ep.id,
      ep.administrative_act,
      ep.category_id,
      st.st_name AS category_name,
      ep.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ep.community_name,
      ep.final_date,
      ep.geo_city_id,
      gcity.name AS geo_city_name,
      ep.geo_country_id,
      gctry.name AS geo_country_name,
      ep.geo_state_id,
      gs.name AS geo_state_name,
      ep.name_ext_project,
      ep.institution,
      ep.observation,
      ep.project_name,
      ep.start_date,
      ep.active,
      ep.research_group_id,
      ep.created_by,
      ep.updated_by,
      ep.created_at,
      ep.updated_at
     FROM (((((extension_projects ep
       LEFT JOIN subtypes st ON ((ep.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ep.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ep.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ep.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ep.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_gm_periods", sql_definition: <<-SQL
      SELECT gp.id,
      gp.initial_date,
      gp.final_date,
      gp.group_member_id,
      gp.role_id,
      r.name AS role_name,
      gp.is_current,
      gp.active,
      gp.created_by,
      gp.updated_by,
      gp.created_at,
      gp.updated_at
     FROM (gm_periods gp
       LEFT JOIN roles r ON ((gp.role_id = r.id)));
  SQL
  create_view "siciud.complete_guide_manuals", sql_definition: <<-SQL
      SELECT gm.id,
      gm.title,
      gm.category_id,
      st.st_name AS category_name,
      gm.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      gm.date_of_publication,
      gm.geo_city_id,
      gcity.name AS geo_city_name,
      gm.geo_country_id,
      gctry.name AS geo_country_name,
      gm.geo_state_id,
      gs.name AS geo_state_name,
      gm.observation,
      gm.product_type_id,
      pt.st_name AS product_type_name,
      gm.research_group_id,
      gm.url,
      gm.active,
      gm.created_by,
      gm.updated_by,
      gm.created_at,
      gm.updated_at
     FROM ((((((guide_manuals gm
       LEFT JOIN subtypes st ON ((gm.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((gm.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((gm.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((gm.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((gm.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pt ON ((gm.product_type_id = pt.id)));
  SQL
  create_view "siciud.complete_icds", sql_definition: <<-SQL
      SELECT icd.id,
      icd.category_id,
      st.st_name AS category_name,
      icd.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      icd.geo_city_id,
      gcity.name AS geo_city_name,
      icd.geo_country_id,
      gctry.name AS geo_country_name,
      icd.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((icd.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((icd.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_idi_investigation_projects", sql_definition: <<-SQL
      SELECT iip.id,
      iip.category_id,
      st.st_name AS category_name,
      iip.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      iip.contract_number,
      iip.funding_institution,
      iip.geo_city_id,
      gcity.name AS geo_city_name,
      iip.geo_country_id,
      gctry.name AS geo_country_name,
      iip.geo_state_id,
      gs.name AS geo_state_name,
      iip.institution,
      iip.observation,
      iip.title,
      iip.year,
      iip.active,
      iip.research_group_id,
      iip.created_by,
      iip.updated_by,
      iip.created_at,
      iip.updated_at
     FROM (((((idi_investigation_projects iip
       LEFT JOIN subtypes st ON ((iip.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((iip.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((iip.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((iip.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((iip.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_industrial_designs", sql_definition: <<-SQL
      SELECT ind.id,
      ind.category_id,
      st.st_name AS category_name,
      ind.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ind.geo_city_id,
      gcity.name AS geo_city_name,
      ind.geo_country_id,
      gctry.name AS geo_country_name,
      ind.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((ind.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ind.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_informative_bulletins", sql_definition: <<-SQL
      SELECT ib.id,
      ib.category_id,
      st.st_name AS category_name,
      ib.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ib.elaboration_date,
      ib.geo_city_id,
      gcity.name AS geo_city_name,
      ib.geo_country_id,
      gctry.name AS geo_country_name,
      ib.geo_state_id,
      gs.name AS geo_state_name,
      ib.institution,
      ib.observation,
      ib.title,
      ib.url,
      ib.active,
      ib.research_group_id,
      ib.created_by,
      ib.updated_by,
      ib.created_at,
      ib.updated_at
     FROM (((((informative_bulletins ib
       LEFT JOIN subtypes st ON ((ib.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ib.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ib.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ib.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ib.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_innovations", sql_definition: <<-SQL
      SELECT inn.id,
      inn.name,
      inn.category_id,
      st.st_name AS category_name,
      inn.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      inn.company_name,
      inn.date_of_obtaining,
      inn.geo_city_id,
      gcity.name AS geo_city_name,
      inn.geo_country_id,
      gctry.name AS geo_country_name,
      inn.geo_state_id,
      gs.name AS geo_state_name,
      inn.nit,
      inn.observation,
      inn.product_type_id,
      pt.st_name AS product_type_name,
      inn.research_group_id,
      inn.active,
      inn.created_by,
      inn.updated_by,
      inn.created_at,
      inn.updated_at
     FROM ((((((innovations inn
       LEFT JOIN subtypes st ON ((inn.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((inn.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((inn.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((inn.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((inn.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pt ON ((inn.product_type_id = pt.id)));
  SQL
  create_view "siciud.complete_int_participants", sql_definition: <<-SQL
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
  create_view "siciud.complete_investigation_projects", sql_definition: <<-SQL
      SELECT ip.id,
      ip.category_id,
      st.st_name AS category_name,
      ip.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ip.funding_institution,
      ip.geo_city_id,
      gcity.name AS geo_city_name,
      ip.geo_country_id,
      gctry.name AS geo_country_name,
      ip.geo_state_id,
      gs.name AS geo_state_name,
      ip.institution,
      ip.observation,
      ip.product_type_id,
      pst.st_name AS product_type_name,
      ip.title,
      ip.year,
      ip.active,
      ip.research_group_id,
      ip.created_by,
      ip.updated_by,
      ip.created_at,
      ip.updated_at
     FROM ((((((investigation_projects ip
       LEFT JOIN subtypes st ON ((ip.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ip.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ip.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ip.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ip.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pst ON ((ip.product_type_id = pst.id)));
  SQL
  create_view "siciud.complete_ipl_breeds", sql_definition: <<-SQL
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
      iplb.geo_country_id,
      gctry.name AS geo_country_name,
      iplb.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((iplb.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((iplb.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_knowledge_networks", sql_definition: <<-SQL
      SELECT kn.id,
      kn.name,
      kn.category_id,
      st.st_name AS category_name,
      kn.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      kn.funding_community,
      kn.funding_institution,
      kn.geo_city_id,
      gcity.name AS geo_city_name,
      kn.geo_country_id,
      gctry.name AS geo_country_name,
      kn.geo_state_id,
      gs.name AS geo_state_name,
      kn.start_date,
      kn.finish_date,
      kn.observation,
      kn.research_group_id,
      kn.web_page,
      kn.active,
      kn.created_by,
      kn.updated_by,
      kn.created_at,
      kn.updated_at
     FROM (((((knowledge_networks kn
       LEFT JOIN subtypes st ON ((kn.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((kn.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((kn.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((kn.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((kn.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_license_agreements", sql_definition: <<-SQL
      SELECT la.id,
      la.work_name,
      la.category_id,
      st.st_name AS category_name,
      la.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      la.contract_date,
      la.contract_geo_city_id,
      cgcity.name AS contract_geo_city_name,
      la.contract_geo_country_id,
      cgctry.name AS contract_geo_country_name,
      la.contract_geo_state_id,
      cgs.name AS contract_geo_state_name,
      la.geo_city_id,
      gcity.name AS geo_city_name,
      la.geo_country_id,
      gctry.name AS geo_country_name,
      la.geo_state_id,
      gs.name AS geo_state_name,
      la.license_grant_date,
      la.license_owner_institution,
      la.ncd_registry_number,
      la.observation,
      la.research_group_id,
      la.active,
      la.created_by,
      la.updated_by,
      la.created_at,
      la.updated_at
     FROM ((((((((license_agreements la
       LEFT JOIN subtypes st ON ((la.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((la.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((la.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((la.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((la.geo_country_id = gctry.id)))
       LEFT JOIN geo_cities cgcity ON ((la.contract_geo_city_id = cgcity.id)))
       LEFT JOIN geo_states cgs ON ((la.contract_geo_state_id = cgs.id)))
       LEFT JOIN geo_countries cgctry ON ((la.contract_geo_country_id = cgctry.id)));
  SQL
  create_view "siciud.complete_magazine_editions", sql_definition: <<-SQL
      SELECT me.id,
      me.editorial_name,
      me.editorial_date,
      me.category_id,
      st.st_name AS category_name,
      me.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      me.geo_city_id,
      gcity.name AS geo_city_name,
      me.geo_country_id,
      gctry.name AS geo_country_name,
      me.geo_state_id,
      gs.name AS geo_state_name,
      me.issn,
      me.observation,
      me.publication_year,
      me.research_group_id,
      me.title,
      me.active,
      me.created_by,
      me.updated_by,
      me.created_at,
      me.updated_at
     FROM (((((magazine_editions me
       LEFT JOIN subtypes st ON ((me.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((me.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((me.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((me.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((me.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_new_animal_bs", sql_definition: <<-SQL
      SELECT nab.id,
      nab.name,
      nab.category_id,
      stc.st_name AS category_name,
      nab.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      nab.date,
      nab.geo_city_id,
      gcity.name AS geo_city_name,
      nab.geo_country_id,
      gctry.name AS geo_country_name,
      nab.geo_state_id,
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
     FROM ((((((new_animal_breeds nab
       LEFT JOIN subtypes stc ON ((nab.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((nab.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((nab.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((nab.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((nab.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stpt ON ((nab.petition_status_id = stpt.id)));
  SQL
  create_view "siciud.complete_new_genetic_sequences", sql_definition: <<-SQL
      SELECT ngs.id,
      ngs.name,
      ngs.category_id,
      st.st_name AS category_name,
      ngs.certifying_institution,
      ngs.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      ngs.database_name,
      ngs.database_url,
      ngs.geo_city_id,
      gcity.name AS geo_city_name,
      ngs.geo_country_id,
      gctry.name AS geo_country_name,
      ngs.geo_state_id,
      gs.name AS geo_state_name,
      ngs.observation,
      ngs.obtaining_date,
      ngs.research_group_id,
      ngs.active,
      ngs.created_by,
      ngs.updated_by,
      ngs.created_at,
      ngs.updated_at
     FROM (((((new_genetic_sequences ngs
       LEFT JOIN subtypes st ON ((ngs.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((ngs.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((ngs.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((ngs.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((ngs.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_new_scientific_records", sql_definition: <<-SQL
      SELECT nsr.id,
      nsr.category_id,
      st.st_name AS category_name,
      nsr.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      nsr.geo_city_id,
      gcity.name AS geo_city_name,
      nsr.geo_country_id,
      gctry.name AS geo_country_name,
      nsr.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((nsr.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((nsr.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_nutraceutical_products", sql_definition: <<-SQL
      SELECT np.id,
      np.name,
      np.category_id,
      st.st_name AS category_name,
      np.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      np.consecutive_registration_invima,
      np.date_of_obtaining,
      np.geo_city_id,
      gcity.name AS geo_city_name,
      np.geo_country_id,
      gctry.name AS geo_country_name,
      np.geo_state_id,
      gs.name AS geo_state_name,
      np.observation,
      np.research_group_id,
      np.research_project_title,
      np.active,
      np.created_by,
      np.updated_by,
      np.created_at,
      np.updated_at
     FROM (((((nutraceutical_products np
       LEFT JOIN subtypes st ON ((np.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((np.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((np.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((np.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((np.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_papers", sql_definition: <<-SQL
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
      p.geo_country_id,
      gctry.name AS geo_country_name,
      p.geo_state_id,
      gs.name AS geo_state_name,
      p.initial_page,
      p.issn,
      p.journal_name,
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
     FROM ((((((papers p
       LEFT JOIN subtypes stc ON ((p.category_id = stc.id)))
       LEFT JOIN colciencias_calls cc ON ((p.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((p.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((p.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((p.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stpt ON ((p.paper_type_id = stpt.id)));
  SQL
  create_view "siciud.complete_patents", sql_definition: <<-SQL
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
      p.patent_type_id,
      pttp.st_name AS patent_type_name,
      p.patent_number,
      p.research_group_id,
      p.active,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM ((((patents p
       LEFT JOIN subtypes stc ON ((p.category_id = stc.id)))
       LEFT JOIN subtypes pttp ON ((p.patent_type_id = pttp.id)))
       LEFT JOIN colciencias_calls cc ON ((p.colciencias_call_id = cc.id)))
       LEFT JOIN subtypes stps ON ((p.patent_state_id = stps.id)));
  SQL
  create_view "siciud.complete_plt_ind_prots", sql_definition: <<-SQL
      SELECT pltind.id,
      pltind.category_id,
      st.st_name AS category_name,
      pltind.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      pltind.geo_city_id,
      gcity.name AS geo_city_name,
      pltind.geo_country_id,
      gctry.name AS geo_country_name,
      pltind.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((pltind.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((pltind.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_protocol_acts", sql_definition: <<-SQL
      SELECT pac.id,
      pac.title,
      pac.category_id,
      st.st_name AS category_name,
      pac.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      pac.date_of_publication,
      pac.geo_city_id,
      gcity.name AS geo_city_name,
      pac.geo_country_id,
      gctry.name AS geo_country_name,
      pac.geo_state_id,
      gs.name AS geo_state_name,
      pac.observation,
      pac.product_type_id,
      pt.st_name AS product_type_name,
      pac.research_group_id,
      pac.active,
      pac.created_by,
      pac.updated_by,
      pac.created_at,
      pac.updated_at
     FROM ((((((protocol_acts pac
       LEFT JOIN subtypes st ON ((pac.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((pac.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((pac.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((pac.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((pac.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pt ON ((pac.product_type_id = pt.id)));
  SQL
  create_view "siciud.complete_publications", sql_definition: <<-SQL
      SELECT p.id,
      p.category_id,
      st.st_name AS category_name,
      p.circulation_route,
      p.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      p.duration,
      p.duration_type_id,
      dst.st_name AS duration_type_name,
      p.funding_institution,
      p.final_date,
      p.geo_city_id,
      gcity.name AS geo_city_name,
      p.geo_country_id,
      gctry.name AS geo_country_name,
      p.geo_state_id,
      gs.name AS geo_state_name,
      p.name,
      p.observation,
      p.product_type_id,
      pst.st_name AS product_type_name,
      p.project_title,
      p.start_date,
      p.target_audiences,
      p.url,
      p.active,
      p.research_group_id,
      p.created_by,
      p.updated_by,
      p.created_at,
      p.updated_at
     FROM (((((((publications p
       LEFT JOIN subtypes st ON ((p.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((p.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((p.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((p.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((p.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pst ON ((p.product_type_id = pst.id)))
       LEFT JOIN subtypes dst ON ((p.duration_type_id = dst.id)));
  SQL
  create_view "siciud.complete_regulations", sql_definition: <<-SQL
      SELECT reg.id,
      reg.title,
      reg.category_id,
      st.st_name AS category_name,
      reg.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      reg.date_of_publication,
      reg.geo_city_id,
      gcity.name AS geo_city_name,
      reg.geo_country_id,
      gctry.name AS geo_country_name,
      reg.geo_state_id,
      gs.name AS geo_state_name,
      reg.issuing_entity,
      reg.observation,
      reg.product_type_id,
      pt.st_name AS product_type_name,
      reg.regulation_type_id,
      rt.st_name AS regulation_type_name,
      reg.research_group_id,
      reg.active,
      reg.created_by,
      reg.updated_by,
      reg.created_at,
      reg.updated_at
     FROM (((((((regulations reg
       LEFT JOIN subtypes st ON ((reg.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((reg.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((reg.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((reg.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((reg.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pt ON ((reg.product_type_id = pt.id)))
       LEFT JOIN subtypes rt ON ((reg.regulation_type_id = rt.id)));
  SQL
  create_view "siciud.complete_reports", sql_definition: <<-SQL
      SELECT rp.id,
      rp.name,
      rp.category_id,
      st.st_name AS category_name,
      rp.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      rp.date_of_elaboration,
      rp.geo_city_id,
      gcity.name AS geo_city_name,
      rp.geo_country_id,
      gctry.name AS geo_country_name,
      rp.geo_state_id,
      gs.name AS geo_state_name,
      rp.observation,
      rp.product_type_id,
      pdt.st_name AS product_type_name,
      rp.project_name,
      rp.research_group_id,
      rp.active,
      rp.created_by,
      rp.updated_by,
      rp.created_at,
      rp.updated_at
     FROM ((((((reports rp
       LEFT JOIN subtypes st ON ((rp.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((rp.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((rp.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((rp.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((rp.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pdt ON ((rp.product_type_id = pdt.id)));
  SQL
  create_view "siciud.complete_research_cws", sql_definition: <<-SQL
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
      rcw.geo_country_id,
      gctry.name AS geo_country_name,
      rcw.geo_state_id,
      gs.name AS geo_state_name,
      rcw.knwl_spec_area_id,
      stksa.st_name AS knwl_spec_area_name,
      rcw.nature_id,
      stnt.st_name AS nature_name,
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
     FROM (((((((research_creation_works rcw
       LEFT JOIN subtypes stc ON ((rcw.category_id = stc.id)))
       LEFT JOIN subtypes stnt ON ((rcw.nature_id = stnt.id)))
       LEFT JOIN colciencias_calls cc ON ((rcw.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((rcw.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((rcw.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((rcw.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stksa ON ((rcw.knwl_spec_area_id = stksa.id)));
  SQL
  create_view "siciud.complete_scientific_collections", sql_definition: <<-SQL
      SELECT sc.id,
      sc.name,
      sc.category_id,
      st.st_name AS category_name,
      sc.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      sc.curator_name,
      sc.date_of_obtaining,
      sc.geo_city_id,
      gcity.name AS geo_city_name,
      sc.geo_country_id,
      gctry.name AS geo_country_name,
      sc.geo_state_id,
      gs.name AS geo_state_name,
      sc.information_included,
      sc.last_conservatorship_date,
      sc.managing_institution_name,
      sc.observation,
      sc.research_group_id,
      sc.validity_and_use,
      sc.active,
      sc.created_by,
      sc.updated_by,
      sc.created_at,
      sc.updated_at
     FROM (((((scientific_collections sc
       LEFT JOIN subtypes st ON ((sc.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((sc.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((sc.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((sc.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((sc.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_scientific_notes", sql_definition: <<-SQL
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
      sn.geo_country_id,
      gctry.name AS geo_country_name,
      sn.geo_state_id,
      gs.name AS geo_state_name,
      sn.initial_page,
      sn.issn,
      sn.journal_name,
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
       LEFT JOIN subtypes st ON ((sn.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((sn.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((sn.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((sn.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((sn.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_simple_books", sql_definition: <<-SQL
      SELECT sb.id,
      sb.category_id,
      st.st_name AS category_name,
      sb.editorial_name,
      sb.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      sb.geo_city_id,
      gcity.name AS geo_city_name,
      sb.geo_country_id,
      gctry.name AS geo_country_name,
      sb.geo_state_id,
      gs.name AS geo_state_name,
      sb.isbn,
      sb.observation,
      sb.publication_date,
      sb.product_type_id,
      pst.st_name AS product_type_name,
      sb.title,
      sb.url,
      sb.active,
      sb.research_group_id,
      sb.created_by,
      sb.updated_by,
      sb.created_at,
      sb.updated_at
     FROM ((((((simple_books sb
       LEFT JOIN subtypes st ON ((sb.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((sb.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((sb.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((sb.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((sb.geo_country_id = gctry.id)))
       LEFT JOIN subtypes pst ON ((sb.product_type_id = pst.id)));
  SQL
  create_view "siciud.complete_software", sql_definition: <<-SQL
      SELECT soft.id,
      soft.category_id,
      st.st_name AS category_name,
      soft.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      soft.geo_city_id,
      gcity.name AS geo_city_name,
      soft.geo_country_id,
      gctry.name AS geo_country_name,
      soft.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((soft.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((soft.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_technical_concepts", sql_definition: <<-SQL
      SELECT tc.id,
      tc.title,
      tc.category_id,
      st.st_name AS category_name,
      tc.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      tc.consecutive_number,
      tc.geo_city_id,
      gcity.name AS geo_city_name,
      tc.geo_country_id,
      gctry.name AS geo_country_name,
      tc.geo_state_id,
      gs.name AS geo_state_name,
      tc.observation,
      tc.request_date,
      tc.requesting_institution_name,
      tc.research_group_id,
      tc.send_date,
      tc.active,
      tc.created_by,
      tc.updated_by,
      tc.created_at,
      tc.updated_at
     FROM (((((technical_concepts tc
       LEFT JOIN subtypes st ON ((tc.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((tc.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((tc.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((tc.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((tc.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_training_courses", sql_definition: <<-SQL
      SELECT tc.id,
      tc.category_id,
      st.st_name AS category_name,
      tc.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      tc.date,
      tc.faculty,
      tc.geo_city_id,
      gcity.name AS geo_city_name,
      tc.geo_country_id,
      gctry.name AS geo_country_name,
      tc.geo_state_id,
      gs.name AS geo_state_name,
      tc.id_administrative_act,
      tc.institution,
      tc.num_administrative_act,
      tc.observation,
      tc.program_name,
      tc.active,
      tc.research_group_id,
      tc.created_by,
      tc.updated_by,
      tc.created_at,
      tc.updated_at
     FROM (((((training_courses tc
       LEFT JOIN subtypes st ON ((tc.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((tc.colciencias_call_id = cc.id)))
       LEFT JOIN geo_cities gcity ON ((tc.geo_city_id = gcity.id)))
       LEFT JOIN geo_states gs ON ((tc.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((tc.geo_country_id = gctry.id)));
  SQL
  create_view "siciud.complete_users", sql_definition: <<-SQL
      SELECT u.id,
      u.identification_number,
      u.oas_user_id,
      u.user_role_id,
      ur.name AS user_role_name,
      u.faculties_ids,
      array_length(u.faculties_ids, 1) AS total_faculties,
      ( SELECT count(*) AS count
             FROM group_members gm
            WHERE (r.id = gm.researcher_id)) AS total_structures,
      ( SELECT count(*) AS count
             FROM group_members gm
            WHERE ((r.id = gm.researcher_id) AND (gm.gm_state_id = 1))) AS total_active_structures,
      ( SELECT count(*) AS count
             FROM group_members gm
            WHERE ((r.id = gm.researcher_id) AND (gm.gm_state_id = 2))) AS total_inactive_structures,
      u.active,
      u.created_by,
      u.updated_by,
      u.created_at,
      u.updated_at
     FROM ((users u
       LEFT JOIN user_roles ur ON ((u.user_role_id = ur.id)))
       LEFT JOIN researchers r ON (((u.identification_number)::text = (r.identification_number)::text)));
  SQL
  create_view "siciud.complete_vegetable_varieties", sql_definition: <<-SQL
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
      vv.geo_country_id,
      gctry.name AS geo_country_name,
      vv.geo_state_id,
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
       LEFT JOIN geo_states gs ON ((vv.geo_state_id = gs.id)))
       LEFT JOIN geo_countries gctry ON ((vv.geo_country_id = gctry.id)))
       LEFT JOIN subtypes stpt ON ((vv.petition_status_id = stpt.id)));
  SQL
  create_view "siciud.complete_working_papers", sql_definition: <<-SQL
      SELECT wp.id,
      wp.title,
      wp.category_id,
      st.st_name AS category_name,
      wp.colciencias_call_id,
      cc.name AS colciencias_call_name,
      cc.year AS colciencias_call_year,
      wp.doi,
      wp.elaboration_date,
      wp.observation,
      wp.related_institution,
      wp.research_group_id,
      wp.web_page,
      wp.active,
      wp.created_by,
      wp.updated_by,
      wp.created_at,
      wp.updated_at
     FROM ((working_papers wp
       LEFT JOIN subtypes st ON ((wp.category_id = st.id)))
       LEFT JOIN colciencias_calls cc ON ((wp.colciencias_call_id = cc.id)));
  SQL
  create_view "siciud.research_units_by_researchers", sql_definition: <<-SQL
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
  create_view "siciud.complete_calls", sql_definition: <<-SQL
      SELECT c.id,
      c.call_name,
      c.call_code,
      c.call_beneficiary_id,
      sb.st_name AS call_beneficiary_name,
      c.call_directed_towards,
      c.call_duration,
      c.call_global_budget,
      c.call_max_budget_per_project,
      c.call_objective,
      c.call_start_date,
      c.call_end_date,
      c.call_state_id,
      ss.st_name AS call_state_name,
      c.call_type_id,
      st.st_name AS call_type_name,
      c.active,
      c.created_at,
      c.updated_at,
      c.created_by,
      c.updated_by
     FROM (((calls c
       LEFT JOIN subtypes sb ON ((sb.id = c.call_beneficiary_id)))
       LEFT JOIN subtypes ss ON ((ss.id = c.call_state_id)))
       LEFT JOIN subtypes st ON ((st.id = c.call_type_id)));
  SQL
  create_view "siciud.complete_types", sql_definition: <<-SQL
      SELECT t.id AS type_id,
      t.t_name AS type_name,
      t.t_description AS type_description,
      t.active AS type_active,
      st.parent_id,
      pst.st_name AS parent_name,
      pst.st_description AS parent_description,
      pst.active AS parent_active,
      st.id,
      st.st_name AS name,
      st.st_description AS description,
      st.multiple,
      st.required,
      st.active
     FROM ((types t
       LEFT JOIN subtypes st ON ((t.id = st.type_id)))
       LEFT JOIN subtypes pst ON ((st.parent_id = pst.id)));
  SQL
  create_view "siciud.complete_call_indicators", sql_definition: <<-SQL
      SELECT cind.id,
      cind.call_id,
      cind.indicator_id,
      i.ind_description AS indicator_description,
      i.subtype_id AS product_type_id,
      s.st_name AS product_type_name,
      cind.active,
      cind.created_by,
      cind.updated_by,
      cind.created_at,
      cind.updated_at
     FROM ((calls_indicators cind
       LEFT JOIN indicators i ON ((i.id = cind.indicator_id)))
       LEFT JOIN subtypes s ON ((i.subtype_id = s.id)));
  SQL
  create_view "siciud.complete_call_documents", sql_definition: <<-SQL
      SELECT cd.id,
      cd.call_id,
      cd.document_id,
      s.st_name AS document_name,
      cd.cd_required,
      cd.active,
      cd.created_by,
      cd.updated_by,
      cd.created_at,
      cd.updated_at
     FROM (call_documents cd
       LEFT JOIN subtypes s ON ((s.id = cd.document_id)));
  SQL
  create_view "siciud.complete_call_eval_criteria", sql_definition: <<-SQL
      SELECT cec.id,
      cec.call_id,
      cec.eval_criterion_id,
      s.st_name AS eval_criterion_name,
      cec.cec_percentage,
      cec.active,
      cec.created_by,
      cec.updated_by,
      cec.created_at,
      cec.updated_at
     FROM (call_eval_criteria cec
       LEFT JOIN subtypes s ON ((s.id = cec.eval_criterion_id)));
  SQL
  create_view "siciud.complete_form_a_act_ps", sql_definition: <<-SQL
      SELECT faap.id,
      faap.action_plan_id,
      faap.advanced_total,
      faap.goal,
      faap.indicator_id,
      i.ind_description AS indicator_description,
      i.subtype_id AS indicator_product_type_id,
      sip.st_name AS indicator_product_type_name,
      faap."order",
      faap.plan_type_id,
      splt.st_name AS plan_type_name,
      faap.product_type_id,
      spt.st_name AS product_type_name,
      faap.active,
      faap.created_by,
      faap.updated_by,
      faap.created_at,
      faap.updated_at
     FROM ((((form_a_act_plans faap
       LEFT JOIN indicators i ON ((faap.indicator_id = i.id)))
       LEFT JOIN subtypes sip ON ((i.subtype_id = sip.id)))
       LEFT JOIN subtypes spt ON ((faap.product_type_id = spt.id)))
       LEFT JOIN subtypes splt ON ((faap.plan_type_id = splt.id)));
  SQL
  create_view "siciud.complete_form_b_act_ps", sql_definition: <<-SQL
      SELECT fbap.id,
      fbap.action_plan_id,
      fbap.description,
      fbap.financing_type_id,
      sft.st_name AS financing_type_name,
      fbap.goal_achieved,
      fbap.goal_state_id,
      sgs.st_name AS goal_state_name,
      fbap."order",
      fbap.plan_type_id,
      splt.st_name AS plan_type_name,
      fbap.active,
      fbap.created_by,
      fbap.updated_by,
      fbap.created_at,
      fbap.updated_at
     FROM (((form_b_act_plans fbap
       LEFT JOIN subtypes sft ON ((sft.id = fbap.financing_type_id)))
       LEFT JOIN subtypes sgs ON ((sgs.id = fbap.goal_state_id)))
       LEFT JOIN subtypes splt ON ((fbap.plan_type_id = splt.id)));
  SQL
  create_view "siciud.complete_call_items", sql_definition: <<-SQL
      SELECT ci.id,
      ci.call_id,
      ci.item_id,
      s.st_name AS item_name,
      ci.ci_maximum_percentage,
      ci.ci_percentage,
      ci.active,
      ci.created_by,
      ci.updated_by,
      ci.created_at,
      ci.updated_at
     FROM (call_items ci
       LEFT JOIN subtypes s ON ((s.id = ci.item_id)));
  SQL
  create_view "siciud.complete_indicators", sql_definition: <<-SQL
      SELECT i.id,
      i.subtype_id,
      sin.st_name AS subtype_name,
      sin.type_id,
      t.t_name AS type_name,
      i.ind_description,
      i.active,
      i.created_by,
      i.updated_by,
      i.created_at,
      i.updated_at
     FROM ((indicators i
       LEFT JOIN subtypes sin ON ((sin.id = i.subtype_id)))
       LEFT JOIN types t ON ((sin.type_id = t.id)));
  SQL
  create_view "siciud.complete_affiliated_entities", sql_definition: <<-SQL
      SELECT ae.id,
      ae.research_network_id,
      rn.name AS research_network_name,
      ae.entity_id,
      e.name AS entity_name,
      ae.institution_type_id,
      st.st_name AS institution_type_name,
      ae.geo_country_id,
      gc.name AS geo_country_name,
      ae.active,
      ae.created_by,
      ae.updated_by,
      ae.created_at,
      ae.updated_at
     FROM ((((affiliated_entities ae
       LEFT JOIN research_networks rn ON ((rn.id = ae.research_network_id)))
       LEFT JOIN entities e ON ((e.id = ae.entity_id)))
       LEFT JOIN subtypes st ON ((st.id = ae.institution_type_id)))
       LEFT JOIN geo_countries gc ON ((gc.id = e.geo_country_id)));
  SQL
  create_view "siciud.complete_action_plans", sql_definition: <<-SQL
      SELECT ap.id,
      ap.execution_validity,
      ap.research_group_id,
      rg.name AS research_group_name,
      rg.acronym AS research_group_acronym,
      rg.gruplac AS research_group_gruplac,
      ap.is_draft,
      ap.management_report_is_draft,
      ap.active,
      ap.created_by,
      ap.updated_by,
      ap.created_at,
      ap.updated_at,
      ap.published_at,
      ap.management_report_published_at
     FROM (action_plans ap
       LEFT JOIN research_groups rg ON ((rg.id = ap.research_group_id)));
  SQL
  create_view "siciud.complete_rg_research_networks", sql_definition: <<-SQL
      SELECT rgrn.id,
      rgrn.research_group_id,
      rg.name AS research_group_name,
      rgrn.research_network_id,
      rgrn.has_expiration,
      rgrn.expiration_date,
      rgrn.active,
      rgrn.created_by,
      rgrn.updated_by,
      rgrn.created_at,
      rgrn.updated_at
     FROM (research_groups_research_networks rgrn
       LEFT JOIN research_groups rg ON ((rgrn.research_group_id = rg.id)));
  SQL
  create_view "siciud.complete_entities", sql_definition: <<-SQL
      SELECT ent.id,
      ent.name,
      ent.nit,
      ent.check_digit,
      ent.constitution_date,
      ent.email,
      ent.headquarters_address,
      ent.institution_type_id,
      sit.st_name AS institution_type_name,
      ent.geo_city_id,
      ent.geo_country_id,
      ent.geo_state_id,
      ent.legal_nature_id,
      sln.st_name AS legal_nature_name,
      ent.phone,
      ent.registration,
      ent.web_page,
      ent.active,
      ent.created_by,
      ent.updated_by,
      ent.created_at,
      ent.updated_at
     FROM ((entities ent
       LEFT JOIN subtypes sit ON ((ent.institution_type_id = sit.id)))
       LEFT JOIN subtypes sln ON ((ent.legal_nature_id = sln.id)));
  SQL
  create_view "siciud.complete_hist_lrs", sql_definition: <<-SQL
      SELECT hlr.id,
      hlr.entity_id,
      e.name AS entity_name,
      hlr.legal_representative_id,
      lr.name AS legal_representative_name,
      lr.identification_number AS legal_representative_identification,
      lr.email AS legal_representative_email,
      lr.identification_type_id AS legal_representative_identification_type,
      hlr.is_current,
      hlr.active,
      hlr.created_by,
      hlr.updated_by,
      hlr.created_at,
      hlr.updated_at
     FROM ((hist_legal_representatives hlr
       LEFT JOIN entities e ON ((hlr.entity_id = e.id)))
       LEFT JOIN legal_representatives lr ON ((hlr.legal_representative_id = lr.id)));
  SQL
  create_view "siciud.complete_hist_contacts", sql_definition: <<-SQL
      SELECT hc.id,
      hc.contact_id,
      c.name AS contact_name,
      c.email AS contact_email,
      c.phone AS contact_phone,
      hc.dependency_id,
      hc.is_current,
      hc.active,
      hc.created_by,
      hc.updated_by,
      hc.created_at,
      hc.updated_at
     FROM (hist_contacts hc
       LEFT JOIN contacts c ON ((hc.contact_id = c.id)));
  SQL
  create_view "siciud.complete_form_d_act_ps", sql_definition: <<-SQL
      SELECT fdap.id,
      fdap.action_plan_id,
      fdap.name,
      fdap.description,
      fdap.goal_achieved,
      fdap.goal_state_id,
      sgs.st_name AS goal_state_name,
      fdap."order",
      fdap.plan_type_id,
      spl.st_name AS plan_type_name,
      ( SELECT count(*) AS count
             FROM cine_detailed_areas_form_d_act_plans
            WHERE (cine_detailed_areas_form_d_act_plans.form_d_act_plan_id = fdap.id)) AS total_cine_detailed_areas,
      ( SELECT count(*) AS count
             FROM cine_specific_areas_form_d_act_plans
            WHERE (cine_specific_areas_form_d_act_plans.form_d_act_plan_id = fdap.id)) AS total_cine_specific_areas,
      ( SELECT count(*) AS count
             FROM form_d_act_plans_oecd_disciplines
            WHERE (form_d_act_plans_oecd_disciplines.form_d_act_plan_id = fdap.id)) AS total_oecd_disciplines,
      ( SELECT count(*) AS count
             FROM form_d_act_plans_oecd_knowledge_subareas
            WHERE (form_d_act_plans_oecd_knowledge_subareas.form_d_act_plan_id = fdap.id)) AS total_oecd_knowledge_subareas,
      ( SELECT count(*) AS count
             FROM research_focuses_form_d_plans
            WHERE (research_focuses_form_d_plans.form_d_act_plan_id = fdap.id)) AS total_research_focuses,
      fdap.active,
      fdap.created_by,
      fdap.updated_by,
      fdap.created_at,
      fdap.updated_at
     FROM ((form_d_act_plans fdap
       LEFT JOIN subtypes sgs ON ((sgs.id = fdap.goal_state_id)))
       LEFT JOIN subtypes spl ON ((fdap.plan_type_id = spl.id)));
  SQL
  create_view "siciud.research_units", sql_definition: <<-SQL
      SELECT rg.id,
      rg.legacy_siciud_id,
      rg.name,
      rg.acronym,
      rg.parent_id,
      ( SELECT research_groups.name
             FROM research_groups
            WHERE (rg.parent_id = research_groups.id)) AS parent_name,
      ( SELECT count(*) AS count
             FROM research_groups
            WHERE (rg.id = research_groups.parent_id)) AS child_structures_count,
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
      rg.group_type_id,
      stgt.st_name AS group_type_name,
      rg.group_state_id,
      stgs.st_name AS group_state_name,
      rg.interinstitutional,
      ARRAY( SELECT group_members.researcher_id
             FROM group_members
            WHERE (group_members.research_group_id = rg.id)) AS member_ids,
      ARRAY( SELECT r.identification_number
             FROM (group_members gm
               LEFT JOIN researchers r ON ((gm.researcher_id = r.id)))
            WHERE (gm.research_group_id = rg.id)) AS member_documents,
      ( SELECT count(*) AS count
             FROM group_members
            WHERE (group_members.research_group_id = rg.id)) AS member_count,
      ( SELECT count(*) AS count
             FROM group_members
            WHERE ((group_members.research_group_id = rg.id) AND (group_members.gm_state_id = 1))) AS active_member_count,
      ( SELECT count(*) AS count
             FROM group_members
            WHERE ((group_members.research_group_id = rg.id) AND (group_members.gm_state_id = 2))) AS inactive_member_count,
      ARRAY( SELECT faculty_ids_research_groups.faculty_id
             FROM faculty_ids_research_groups
            WHERE (faculty_ids_research_groups.research_group_id = rg.id)) AS faculty_ids,
      ( SELECT count(*) AS count
             FROM faculty_ids_research_groups
            WHERE (faculty_ids_research_groups.research_group_id = rg.id)) AS total_faculties,
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
      rg.snies_id,
      sn.st_name AS snies_name,
      rg.created_at,
      rg.updated_at,
      rg.created_by,
      rg.updated_by
     FROM (((research_groups rg
       LEFT JOIN subtypes stgt ON ((rg.group_type_id = stgt.id)))
       LEFT JOIN subtypes stgs ON ((rg.group_state_id = stgs.id)))
       LEFT JOIN subtypes sn ON ((rg.snies_id = sn.id)));
  SQL
  create_view "siciud.complete_research_networks", sql_definition: <<-SQL
      SELECT rn.id,
      rn.name,
      rn.acronym,
      rn.academic_responsibilities,
      rn.advantage,
      rn.cine_broad_area_id,
      cba.name AS cine_broad_area_name,
      rn.cine_specific_area_id,
      csa.name AS cine_specific_area_name,
      rn.financial_responsibilities,
      rn.legal_responsibilities,
      rn.main_research_group_id,
      rg.name AS main_research_group_name,
      ARRAY( SELECT research_groups_research_networks.research_group_id
             FROM research_groups_research_networks
            WHERE (research_groups_research_networks.research_network_id = rn.id)) AS research_group_ids,
      ( SELECT count(*) AS count
             FROM research_groups_research_networks
            WHERE (research_groups_research_networks.research_network_id = rn.id)) AS research_group_count,
      rn.mission,
      rn.network_type_id,
      snt.st_name AS network_type_name,
      rn.oecd_knowledge_area_id,
      oka.name AS oecd_knowledge_area_name,
      rn.oecd_knowledge_subarea_id,
      oks.name AS oecd_knowledge_subarea_name,
      rn.researcher_id,
      r.identification_number AS researcher_identification_number,
      rn.request_date,
      rn.snies_id,
      sn.st_name AS snies_name,
      rn.vision,
      rn.active,
      rn.created_by,
      rn.updated_by,
      rn.created_at,
      rn.updated_at
     FROM ((((((((research_networks rn
       LEFT JOIN cine_broad_areas cba ON ((rn.cine_broad_area_id = cba.id)))
       LEFT JOIN cine_specific_areas csa ON ((rn.cine_specific_area_id = csa.id)))
       LEFT JOIN research_groups rg ON ((rn.main_research_group_id = rg.id)))
       LEFT JOIN subtypes snt ON ((rn.network_type_id = snt.id)))
       LEFT JOIN oecd_knowledge_areas oka ON ((rn.oecd_knowledge_area_id = oka.id)))
       LEFT JOIN oecd_knowledge_subareas oks ON ((rn.oecd_knowledge_subarea_id = oks.id)))
       LEFT JOIN researchers r ON ((rn.researcher_id = r.id)))
       LEFT JOIN subtypes sn ON ((rn.snies_id = sn.id)));
  SQL
  create_view "siciud.complete_form_c_act_ps", sql_definition: <<-SQL
      SELECT fcap.id,
      fcap.action_plan_id,
      fcap.advanced_total,
      fcap.description,
      fcap.goal,
      fcap."order",
      fcap.plan_type_id,
      spl.st_name AS plan_type_name,
      fcap.child_prod_type_id,
      scpt.st_name AS child_prod_type_name,
      fcap.product_type_id,
      spt.st_name AS product_type_name,
      fcap.active,
      fcap.created_by,
      fcap.updated_by,
      fcap.created_at,
      fcap.updated_at
     FROM (((form_c_act_plans fcap
       LEFT JOIN subtypes spl ON ((fcap.plan_type_id = spl.id)))
       LEFT JOIN subtypes spt ON ((fcap.product_type_id = spt.id)))
       LEFT JOIN subtypes scpt ON ((fcap.child_prod_type_id = scpt.id)));
  SQL
  create_view "siciud.complete_proposals", sql_definition: <<-SQL
      SELECT p.id,
      p.title,
      p.call_id,
      c.call_code,
      c.call_name,
      p.description,
      p.duration,
      p.geo_city_id,
      gcty.name AS geo_city_name,
      p.geo_country_id,
      gctr.name AS geo_country_name,
      p.geo_state_id,
      gs.name AS geo_state_name,
      p.project_type_id,
      spj.st_name AS project_type_name,
      p.proposal_status_id,
      sps.st_name AS proposal_status_name,
      ( SELECT count(*) AS count
             FROM dependencies_proposals
            WHERE (p.id = dependencies_proposals.proposal_id)) AS total_dependencies,
      ( SELECT count(*) AS count
             FROM entities_proposals
            WHERE (p.id = entities_proposals.proposal_id)) AS total_entities,
      ( SELECT count(*) AS count
             FROM proposals_research_groups
            WHERE (p.id = proposals_research_groups.proposal_id)) AS total_research_groups,
      p.active,
      p.created_at,
      p.updated_at,
      p.created_by,
      p.updated_by
     FROM ((((((proposals p
       LEFT JOIN calls c ON ((p.call_id = c.id)))
       LEFT JOIN geo_cities gcty ON ((p.geo_city_id = gcty.id)))
       LEFT JOIN geo_countries gctr ON ((p.geo_country_id = gctr.id)))
       LEFT JOIN geo_states gs ON ((p.geo_state_id = gs.id)))
       LEFT JOIN subtypes spj ON ((p.project_type_id = spj.id)))
       LEFT JOIN subtypes sps ON ((p.proposal_status_id = sps.id)));
  SQL
  create_view "siciud.complete_form_e_act_ps", sql_definition: <<-SQL
      SELECT feap.id,
      feap.action_plan_id,
      feap.classification_id,
      scl.st_name AS classification_name,
      feap.description,
      feap.type_description,
      feap.inventoried,
      feap.inventory_plate,
      feap.plan_type_id,
      splt.st_name AS plan_type_name,
      feap.active,
      feap.created_by,
      feap.updated_by,
      feap.created_at,
      feap.updated_at
     FROM ((form_e_act_plans feap
       LEFT JOIN subtypes scl ON ((feap.classification_id = scl.id)))
       LEFT JOIN subtypes splt ON ((feap.plan_type_id = splt.id)));
  SQL
end
