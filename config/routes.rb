Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/health", to: "health#health"

  namespace :api do
    namespace :v1 do
      get 'arp_assignment_reports/index'
    end
  end
  get "/api" => redirect("/api/v1/apidocs/")
  namespace :api do
    namespace :v1 do
      resources :apidocs, only: [:index]

      # General endpoints
      # Geo endpoints
      resources :geo_countries, only: [:index, :show] do
        resources :geo_states, only: [:index, :show]
        resources :geo_cities_by_countries, only: [:index]
      end

      resources :geo_states, only: [:index, :show] do
        resources :geo_cities, only: [:index, :show]
      end

      # Types and Subtypes endpoints
      resources :types, only: [:index, :show, :create, :update]

      resources :subtypes, only: [:index, :show, :create, :update]
      get "/subtypes/by-type/:type_id", to: "subtypes#subtypes_by_type"

      get "/types_all", to: "types#all_types_and_subtypes"

      #Enpoint para actualizar los documentos de los convenios
      put "agreement/:id/attach/", to: "agreement#attach"

      resources :gm_states, only: [:index, :show]
      resources :role, only: [:index, :show]
      resources :researchers, only: [:index, :show, :update, :create]
      get "researcher_research_units", to: "researchers#researcher_research_units"

      resources :funding_entity, only: [:index, :show, :create, :update] do
        resources :fe_contact, only: [:index, :show, :update, :create]
      end
      resources :entity_type, only: [:index]
      resources :item_category, only: [:index, :show, :create, :update]
      resources :agreement_status, only: [:index, :show]
      resources :agreement_type, only: [:index, :show, :create]
      resources :agreement, only: [:index, :show, :create, :update] do
        resources :contribution, only: [:index, :show, :create, :update]
        resources :agreement_research_project, only: [:index, :show, :create, :update]
        get "arp_item/", to: "arp_item#index"
        get "arp_item/:id", to: "arp_item#show"
      end
      resources :contribution, only: [] do
        resources :contribution_funding_entity_item, only: [:index, :show, :create, :update]
      end

      resources :arp_role, only: [:index, :show, :create]

      resources :user_roles, only: [:index, :show, :create, :update]
      put "/user_roles/:id/active", to: "user_roles#change_active"

      resources :agreement_research_project, only: [] do
        resources :contribution_rp_item, only: [:index, :show, :create, :update]
        resources :arp_member, only: [:index, :show, :create]
        resources :arp_general_goal, only: [:index, :show, :create, :update]
        resources :arp_activity, only: [:index, :show, :create, :update]
        resources :arp_assignments, only: [:index, :show, :create, :update]
      end
      resources :arp_general_goal, only: [] do
        resources :arp_specific_goal, only: [:index, :show, :create, :update]
        #put "arp_specific_goal/:id/report_progress/", to: "arp_specific_goal#report_progress"
      end
      resources :arp_specific_goal, only: [] do
        resources :arp_act_s_goal, only: [:index, :show, :create, :update]
        #put "arp_activity/:id/report_progress/", to: "arp_activity#report_progress"
      end
      resources :arp_activity, only: [] do
        resources :arp_activity_report, only: [:index, :show, :create, :update]
        put "arp_activity_report/:id/report_progress/", to: "arp_activity_report#response_activity_progress"
      end
      resources :contribution_rp_item, only: [] do
        resources :arp_expense, only: [:index, :show, :create, :update]
      end
      resources :arp_expense, only: [] do
        resources :arp_payment, only: [:index, :show, :create]
        put "arp_payment/:id/attach/", to: "arp_payment#attach"
      end
      resources :users, only: [:index, :show, :create, :update]
      put "/users/:id/active", to: "users#change_active"

      # Enpoint CRUD de los grupos de investigacion
      resources :research_group, only: [:index, :show, :create, :update], path: 'research_units' do
        resources :documents, only: [:index, :show, :create, :update]

        #    member do
        resources :group_member, only: [:index, :show, :create]
        put "/group_member/:id/deactivate", to: "group_member#deactivate"

        resources :plan_periods do
          #       member do
          resources :research_project_plan
          resources :researcher_formation_plan
          resources :result_transfer_plan
          resources :social_appropriation_plan
        end

        resources :historical_colciencias_ranks, only: [:index, :show, :create, :update]

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

        # Social appropriation of knowledge
        resources :events, only: [:index, :show, :create, :update]
        put "/events/:id/active", to: "events#change_active"

        # Human Resource Training for CTel
        resources :degree_works, only: [:index, :show, :create, :update]
        put "/degree_works/:id/active", to: "degree_works#change_active"
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

      # RESEARCH UNIT PRODUCT ENDPOINTS
      ## Participants in product creation and documents
      resources :books, :book_chapters, :ip_livestock_breeds, :new_animal_breeds,
                :papers, :patents, :research_creation_works, :scientific_notes,
                :vegetable_varieties, :industrial_designs,
                :integrated_circuit_diagrams, :software,
                :plant_ind_prototypes, :new_scientific_records, :scientific_collections,
                :technical_concepts, :distinctive_signs, :nutraceutical_products,
                :enterprise_secrets, :enterprises, :innovations, :regulations,
                :clinical_practice_guidelines, :guide_manuals,
                :protocol_acts, :bills,
                :events, :degree_works,
                only: [] do
        resources :ext_participants, only: [:index, :show, :create, :update]
        resources :int_participants, only: [:index, :show, :create, :update]
        resources :documents, only: [:index, :show, :create, :update]
      end

      ## Endpoints research_creation_works
      resources :research_creation_works, only: [] do
        resources :awards, only: [:index, :show, :create, :update]
      end

      resources :colciencias_calls, only: [:index, :create, :update]
      resources :colciencias_categories, only: [:index, :create, :update]

      # Main endpoints for Calls
      resources :calls, only: [:index, :show, :create, :update] do
        resources :calls_product_types, only: [:index, :create, :update, :destroy], path: 'production_items'
        resources :call_item_categories, only: [:index, :create, :update, :destroy], path: 'call_items'
        resources :calls_required_documents, only: [:index, :create, :update, :destroy], path: 'required_documents'
      end
      put "calls/:id/attach/", to: "calls#attach"
      resources :call_types, only: [:index]
      resources :call_user_roles, only: [:index]
      resources :duration_types, only: [:index]
      resources :required_types, only: [:index]
      resources :item_calls, only: [:index]
      resources :required_documents, only: [:index]

      # Endpoints OECD
      resources :oecd_knowledge_areas, only: [:index, :create, :update]
      resources :oecd_knowledge_subareas, only: [:index, :create, :update]
      resources :oecd_disciplines, only: [:index, :create, :update]

      # Endpoints CINE
      resources :cine_broad_areas, only: [:index, :create, :update]
      resources :cine_specific_areas, only: [:index, :create, :update]
      resources :cine_detailed_areas, only: [:index, :create, :update]
    end
  end
end
