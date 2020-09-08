class OrderlyMigration < ActiveRecord::Migration[5.2]
  def change
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

      create_table "cine_broad_areas", force: :cascade do |t|
        t.string "name"
        t.string "code"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "cine_detailed_areas", force: :cascade do |t|
        t.string "code"
        t.string "name"
        t.bigint "cine_specific_area_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["cine_specific_area_id"], name: "index_cine_detailed_areas_on_cine_specific_area_id"
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
        t.index ["cine_broad_area_id"], name: "index_cine_specific_areas_on_cine_broad_area_id"
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

      create_table "curricular_projects", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
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

      create_table "duration_types", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "entity_types", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "faculty_ids_research_groups", force: :cascade do |t|
        t.bigint "research_group_id"
        t.integer "facultyId"
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

      create_table "gm_periods", force: :cascade do |t|
        t.date "initialDate"
        t.date "finalDate"
        t.integer "role_id"
        t.integer "group_member_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["group_member_id"], name: "index_gm_periods_on_group_member_id"
        t.index ["role_id"], name: "index_gm_periods_on_role_id"
      end

      create_table "group_members", force: :cascade do |t|
        t.integer "role_id"
        t.integer "researcher_id"
        t.integer "research_group_id"
        t.integer "state_researcher_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["research_group_id"], name: "index_group_members_on_research_group_id"
        t.index ["researcher_id"], name: "index_group_members_on_researcher_id"
        t.index ["role_id"], name: "index_group_members_on_role_id"
        t.index ["state_researcher_id"], name: "index_group_members_on_state_researcher_id"
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

      create_table "item_categories", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "oecd_disciplines", force: :cascade do |t|
        t.string "name"
        t.string "code"
        t.bigint "oecd_knowledge_subarea_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["oecd_knowledge_subarea_id"], name: "index_oecd_disciplines_on_oecd_knowledge_subarea_id"
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
      end

      create_table "oecd_knowledge_subareas", force: :cascade do |t|
        t.string "name"
        t.string "code"
        t.bigint "oecd_knowledge_area_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["oecd_knowledge_area_id"], name: "index_oecd_knowledge_subareas_on_oecd_knowledge_area_id"
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
        t.integer "codeNumber"
        t.integer "identificationNumber"
        t.string "name"
        t.string "lastName"
        t.integer "document_type_id"
        t.string "birthPlace"
        t.integer "snies_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "researcher_type_id"
        t.string "orcid_id"
        t.string "academic_email"
        t.string "scientific_signature"
        t.index ["document_type_id"], name: "index_researchers_on_document_type_id"
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

      create_table "user_roles", force: :cascade do |t|
        t.string "name"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end

      create_table "user_roles_users", id: false, force: :cascade do |t|
        t.bigint "user_id", null: false
        t.bigint "user_role_id", null: false
      end

      create_table "users", force: :cascade do |t|
        t.string "username"
        t.bigint "researcher_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["researcher_id"], name: "index_users_on_researcher_id"
      end

      add_foreign_key "arp_assignment_reports", "arp_assignments"
      add_foreign_key "arp_assignments", "agreement_research_projects"
      add_foreign_key "arp_assignments", "product_typologies"
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
      add_foreign_key "cine_detailed_areas", "cine_specific_areas"
      add_foreign_key "cine_specific_areas", "cine_broad_areas"
      add_foreign_key "faculty_ids_research_groups", "research_groups"
      add_foreign_key "oecd_disciplines", "oecd_knowledge_subareas"
      add_foreign_key "oecd_knowledge_subareas", "oecd_knowledge_areas"
      add_foreign_key "product_types", "product_typologies"
      add_foreign_key "users", "researchers"
    end
end