Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "health#health"
  get "/api" => redirect("/api/v1/apidocs/")
  namespace :api do
    namespace :v1 do
      resources :apidocs, only: [:index]

      resources :manuals, only: [] do
        resources :documents, only: [:index, :show, :create, :update]
      end

      # General endpoints
      # Geo endpoints
      resources :evaluators, only: [:index, :show, :create, :update]

      resources :geo_countries, only: [:index, :show] do
        resources :geo_states, only: [:index, :show]
        resources :geo_cities_by_countries, only: [:index]
      end
      resources :geo_states, only: [:index, :show] do
        resources :geo_cities, only: [:index, :show]
      end
      resources :keywords, only: [:index, :show, :create, :update]

      # Types and Subtypes endpoints
      resources :types, only: [:index, :show, :create, :update]
      get "/types_all", to: "types#all_types_and_subtypes"
      resources :subtypes, only: [:index, :show, :create, :update]
      get "/subtypes/by-type/:type_id", to: "subtypes#subtypes_by_type"

      resources :gm_states, only: [:index, :show]
      resources :role, only: [:index, :show, :create, :update]
      resources :researchers, only: [:index, :show, :update, :create] do
        resources :mobility_calls, only: [:index]
      end
      get "researcher_research_units", to: "researchers#researcher_research_units"

      resources :user_roles, only: [:index, :show, :create, :update]
      resources :users, only: [:index, :show, :create, :update]
      put "/users/:id/active", to: "users#change_active"

      # Action plan
      resources :action_plans, only: [:index, :show, :update] do
        resources :form_a_act_plans, only: [:index, :create, :update]
        resources :form_b_act_plans, only: [:index, :create, :update]
        resources :form_c_act_plans, only: [:index, :create, :update]
        resources :form_d_act_plans, only: [:index, :create, :update]
        resources :form_e_act_plans, only: [:index, :create, :update]
      end
      get "/action_plans_print/:action_plan_id", to: "action_plans#action_plan_print"
      resources :ap_management_reports, only: [:update]
      resources :form_a_act_plans, :form_b_act_plans,
                :form_c_act_plans, :form_d_act_plans, only: [:show] do
        resources :documents, only: [:index, :show, :create, :update]
      end
      resources :form_e_act_plans, only: [:show]

      # Enpoint CRUD de los grupos de investigacion
      resources :research_group, only: [:index, :show, :create, :update], path: 'research_units' do
        resources :action_plans, only: [:index, :create]
        resources :documents, only: [:index, :show, :create, :update]
        resources :group_member, only: [:index, :show, :create, :update]
        resources :historical_colciencias_ranks, only: [:index, :show, :create, :update]
        resources :mobility_calls, only: [:index]

        # PRODUCTS ENDPOINTS BY TYPOLOGY
        # New generation products endpoints
        resources :books, only: [:index, :show, :create, :update]
        put "/books/:id/active", to: "books#change_active"

        resources :book_chapters, only: [:index, :show, :create, :update]
        put "book_chapters/:id/active/", to: "book_chapters#change_active"

        resources :ip_livestock_breeds, only: [:index, :show, :create, :update]
        put "/ip_livestock_breeds/:id/active", to: "ip_livestock_breeds#change_active"

        resources :new_animal_breeds, only: [:index, :show, :create, :update]
        put "/new_animal_breeds/:id/active", to: "new_animal_breeds#change_active"

        resources :papers, only: [:index, :show, :create, :update]
        put "/papers/:id/active", to: "papers#change_active"

        resources :patents, only: [:index, :show, :create, :update]
        put "/patents/:id/active", to: "patents#change_active"

        resources :research_creation_works, only: [:index, :show, :create, :update]
        put "/research_creation_works/:id/active", to: "research_creation_works#change_active"

        resources :scientific_notes, only: [:index, :show, :create, :update]
        put "/scientific_notes/:id/active", to: "scientific_notes#change_active"

        resources :vegetable_varieties, only: [:index, :show, :create, :update]
        put "/vegetable_varieties/:id/active", to: "vegetable_varieties#change_active"

        # Technological development and innovation
        resources :industrial_designs, only: [:index, :show, :create, :update]
        put "/industrial_designs/:id/active", to: "industrial_designs#change_active"

        resources :integrated_circuit_diagrams, only: [:index, :show, :create, :update]
        put "/integrated_circuit_diagrams/:id/active", to: "integrated_circuit_diagrams#change_active"

        resources :software, only: [:index, :show, :create, :update]
        put "/software/:id/active", to: "software#change_active"

        resources :plant_ind_prototypes, only: [:index, :show, :create, :update]
        put "/plant_ind_prototypes/:id/active", to: "plant_ind_prototypes#change_active"

        resources :new_scientific_records, only: [:index, :show, :create, :update]
        put "/new_scientific_records/:id/active", to: "new_scientific_records#change_active"

        resources :technical_concepts, only: [:index, :create]
        resources :distinctive_signs, only: [:index, :create]
        resources :nutraceutical_products, only: [:index, :create]
        resources :scientific_collections, only: [:index, :create]
        resources :enterprise_secrets, only: [:index, :create]
        resources :enterprises, only: [:index, :create]
        resources :innovations, only: [:index, :create]
        resources :regulations, only: [:index, :create]
        resources :clinical_practice_guidelines, only: [:index, :create]
        resources :guide_manuals, only: [:index, :create]
        resources :protocol_acts, only: [:index, :create]
        resources :bills, only: [:index, :create]
        resources :license_agreements, only: [:index, :create]
        resources :knowledge_networks, only: [:index, :create]

        # Social appropriation of knowledge
        resources :events, only: [:index, :show, :create, :update]
        put "/events/:id/active", to: "events#change_active"
        resources :appropriation_processes, only: [:index, :create]
        resources :creation_workshops, only: [:index, :create]
        resources :working_papers, only: [:index, :create]
        resources :new_genetic_sequences, only: [:index, :create]
        resources :reports, only: [:index, :create]
        resources :consultancies, only: [:index, :create]
        resources :magazine_editions, only: [:index, :create]
        resources :publications, only: [:index, :create]
        resources :simple_books, only: [:index, :create]
        resources :content_generations, only: [:index, :create]
        resources :informative_bulletins, only: [:index, :create]
        # Human Resource Training for CTel
        resources :degree_works, only: [:index, :show, :create, :update]
        put "/degree_works/:id/active", to: "degree_works#change_active"
        resources :investigation_projects, only: [:index, :create]
        resources :idi_investigation_projects, only: [:index, :create]
        resources :extension_projects, only: [:index, :create]
        resources :training_courses, only: [:index, :create]
        resources :accompaniment_consultancies, only: [:index, :create]

      end

      # Technological development and innovation
      resources :technical_concepts, only: [:show, :update]
      resources :distinctive_signs, only: [:show, :update]
      resources :nutraceutical_products, only: [:show, :update]
      resources :scientific_collections, only: [:show, :update]
      resources :enterprise_secrets, only: [:show, :update]
      resources :enterprises, only: [:show, :update]
      resources :innovations, only: [:show, :update]
      resources :regulations, only: [:show, :update]
      resources :clinical_practice_guidelines, only: [:show, :update]
      resources :guide_manuals, only: [:show, :update]
      resources :protocol_acts, only: [:show, :update]
      resources :bills, only: [:show, :update]
      resources :license_agreements, only: [:show, :update]
      resources :knowledge_networks, only: [:show, :update]

      # Social appropriation of knowledge
      resources :appropriation_processes, only: [:show, :update]
      resources :creation_workshops, only: [:show, :update]
      resources :working_papers, only: [:show, :update]
      resources :new_genetic_sequences, only: [:show, :update]
      resources :reports, only: [:show, :update]
      resources :consultancies, only: [:show, :update]
      resources :magazine_editions, only: [:show, :update]
      resources :publications, only: [:show, :update]
      resources :simple_books, only: [:show, :update]
      resources :content_generations, only: [:show, :update]
      resources :informative_bulletins, only: [:show, :update]

      # Human Resource Training for CTel
      resources :investigation_projects, only: [:show, :update]
      resources :idi_investigation_projects, only: [:show, :update]
      resources :extension_projects, only: [:show, :update]
      resources :training_courses, only: [:show, :update]
      resources :accompaniment_consultancies, only: [:show, :update]

      # RESEARCH UNIT PRODUCT ENDPOINTS
      ## Participants in product creation and documents
      resources :books, :book_chapters, :ip_livestock_breeds, :new_animal_breeds,
                :papers, :patents, :research_creation_works, :scientific_notes,
                :vegetable_varieties, :industrial_designs, :integrated_circuit_diagrams,
                :software, :plant_ind_prototypes, :new_scientific_records,
                :scientific_collections, :technical_concepts, :distinctive_signs,
                :nutraceutical_products, :enterprise_secrets, :enterprises, :innovations,
                :regulations, :clinical_practice_guidelines, :guide_manuals,
                :protocol_acts, :bills, :license_agreements, :events,
                :appropriation_processes, :knowledge_networks, :creation_workshops,
                :working_papers, :new_genetic_sequences, :reports, :consultancies,
                :magazine_editions,
                :publications, :simple_books,
                :degree_works, :content_generations,
                :informative_bulletins, :investigation_projects,
                :idi_investigation_projects,
                :extension_projects, :training_courses,
                :accompaniment_consultancies,
                only: [] do
        resources :ext_participants, only: [:index, :show, :create, :update]
        resources :int_participants, only: [:index, :show, :create, :update]
        resources :documents, only: [:index, :show, :create, :update]
      end

      ## Endpoints research_creation_works
      resources :research_creation_works, only: [] do
        resources :awards, only: [:index, :show, :create, :update]
      end
      resources :group_member, only: [] do
        resources :gm_periods, only: [:index, :create]
      end
      resources :gm_periods, only: [:show, :update]

      resources :colciencias_calls, only: [:index, :create, :update]
      resources :colciencias_categories, only: [:index, :create, :update]

      # Endpoints OECD
      resources :oecd_knowledge_areas, only: [:index, :create, :update]
      resources :oecd_knowledge_subareas, only: [:index, :create, :update]
      resources :oecd_disciplines, only: [:index, :create, :update]

      # Endpoints CINE
      resources :cine_broad_areas, only: [:index, :create, :update]
      resources :cine_specific_areas, only: [:index, :create, :update]
      resources :cine_detailed_areas, only: [:index, :create, :update]

      # Endpoints to Calls
      resources :indicators, only: [:index, :show, :create, :update]

      resources :calls, only: [:index, :show, :create, :update] do
        resources :call_documents, only: [:index, :create]
        resources :call_eval_criteria, only: [:index, :create]
        resources :call_items, only: [:index, :create]
        resources :calls_indicators, only: [:index, :create]
        resources :schedule_activities, only: [:index, :create]

        # Endpoint to proposals
        resources :proposals, only: [:index, :create]

        resources :mobility_calls, only: [:index, :create]
      end
      resources :call_documents, only: [:show, :update]
      resources :call_eval_criteria, only: [:show, :update]
      resources :call_items, only: [:show, :update]
      resources :calls_indicators, only: [:show, :update]
      resources :schedule_activities, only: [:show, :update]

      resources :mobility_calls, only: [:index, :show, :update] do
        resources :documents, only: [:index, :show, :create, :update]
        resources :mobility_call_criteria, only: [:index, :create]
      end
      resources :mobility_call_criteria, only: [:show, :update]

      # Endpoint to proposals
      get "/proposals/by-internal-member", to: "proposals#index_by_researcher"

      resources :proposals, only: [:index, :show, :update] do
        resources :activity_schedules, only: [:index, :create]
        get "evaluators", to: "evaluators#index_by_proposal"
        get "validate_proposal", to: "proposals#validate_proposal"
        resources :proposal_budgets, only: [:index, :create]
        resources :external_members_proposals, only: [:index, :create]
        resources :impacts, only: [:index, :create]
        resources :internal_members_proposals, only: [:index, :create]
        resources :item_details, only: [:index, :create]
        resources :objectives, only: [:index, :create]
        resources :proposal_products, only: [:index, :create]
        resources :research_groups_proposals, only: [:index, :create]
        resources :risks, only: [:index, :create]
        resources :chapters, only: [:index, :show, :create, :update]
        resources :documents, only: [:index, :show, :create, :update]
      end
      resources :activity_schedules, only: [:show, :update]
      resources :proposal_budgets, only: [:show, :update] do
        resources :item_details, only: [:index]
      end
      resources :external_members_proposals, only: [:show, :update]
      resources :impacts, only: [:show, :update]
      resources :internal_members_proposals, only: [:show, :update]
      resources :item_details, only: [:show, :update]
      resources :objectives, only: [:show, :update]
      resources :proposal_products, only: [:show, :update]
      resources :research_groups_proposals, only: [:show, :update]
      resources :risks, only: [:show, :update]

      #  Chapters or sections
      resources :calls, only: [] do
        resources :chapters, only: [:index, :show, :create, :update]
        resources :documents, only: [:index, :show, :create, :update]
      end

      #rutas OTRI
      resources :procedures, only: [:index, :show, :update, :create]
      put "/procedures/:id/active", to: "procedures#change_active"
      resources :professional_roles, only: [:index, :show, :update, :create]
      put "/professional_roles/:id/active", to: "professional_roles#change_active"
      resources :task_models, only: [:index, :show, :update, :create]
      put "/task_models/:id/active", to: "task_models#change_active"
      resources :task_models, only: [:index, :show, :update, :create] do
        resources :next_tasks, only: [:index, :create]
        resources :task_attributes, only: [:index, :create]
        resources :read_attributes, only: [:index, :create]
      end
      resources :next_tasks, only: [:show, :update]
      put "/next_tasks/:id/active", to: "next_tasks#change_active"
      resources :task_attributes, only: [:show, :update]
      put "/task_attributes/:id/active", to: "task_attributes#change_active"
      resources :read_attributes, only: [:show, :update]
      put "/read_attributes/:id/active", to: "read_attributes#change_active"
      resources :otri_professionals, only: [:index, :show, :update, :create]
      put "/otri_professionals/:id/active", to: "otri_professionals#change_active"
      resources :procedure_requests, only: [:index, :show, :update, :create] do
        resources :technology_descriptions, only: [:index, :create]
        resources :request_has_application_areas, only: [:index, :create]
        resources :potential_markets, only: [:index, :create]
        resources :technological_situations, only: [:index, :create]
        resources :functional_applications, only: [:index, :create]
      end
      put "/procedure_requests/:id/active", to: "procedure_requests#change_active"

      resources :technology_descriptions, only: [:show, :update]
      put "/technology_descriptions/:id/active", to: "technology_descriptions#change_active"

      put "/request_has_application_areas/:id/active", to: "request_has_application_areas#change_active"

      resources :potential_markets, only: [:show, :update]
      put "/potential_markets/:id/active", to: "potential_markets#change_active"

      resources :technological_situations, only: [:show, :update]
      put "/technological_situations/:id/active", to: "technological_situations#change_active"

      resources :functional_applications, only: [:show, :update]
      put "/functional_applications/:id/active", to: "functional_applications#change_active"

      get "/tasks/by_professional", to: "tasks#index_by_professional"
      resources :tasks, only: [:show, :update] do
        resources :budgets, only: [:index, :create]
        resources :task_has_states, only: [:index, :create]
      end
      put "/tasks/:id/active", to: "tasks#change_active"

      resources :task_has_states, only: [:show]
      put "/task_has_states/:id/active", to: "task_has_states#change_active"

      resources :budgets, only: [:show, :update]
      put "/budgets/:id/active", to: "budgets#change_active"

      resources :request_has_procedures, only: [:index, :show, :create] do
        resources :tasks, only: [:index, :create]
      end
      put "/request_has_procedures/:id/active", to: "request_has_procedures#change_active"

      #
      resources :contacts, only: [:index, :show, :update, :create]
      resources :hist_legal_representatives, only: [:show, :update]
      resources :hist_contacts, only: [:show, :update]
      resources :dependencies, only: [:show, :update] do
        resources :hist_contacts, only: [:index, :create]
      end
      resources :entities, only: [:index, :show, :update, :create] do
        resources :hist_legal_representatives, only: [:index, :create]
        resources :dependencies, only: [:index, :create]
      end
      resources :legal_representatives, only: [:index, :show, :update, :create]
      resources :affiliated_entities, only: [:index, :show, :update]
      resources :research_groups_research_networks, only: [:show, :update] do
        resources :documents, only: [:index, :show, :create, :update]
      end
      resources :research_networks, only: [:index, :show, :update, :create] do
        resources :affiliated_entities, only: [:index, :create]
        resources :documents, only: [:index, :show, :create, :update]
        resources :research_groups_research_networks, only: [:index, :create]
      end
    end
  end
end
