Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'arp_assignment_reports/index'
    end
  end
  get "/api" => redirect("/api/v1/apidocs/")
  namespace :api do
    namespace :v1 do
      get "country", to: "country#index"
      get "country/:name", to: "country#show"
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
      resources :types, only: [:index, :all, :show, :create, :update] do
        resources :subtypes, only: [:index, :show, :create, :update]
        put "/subtypes/:id/active", to: "subtypes#change_active"
      end
      get "/types_all", to: "types#all"
      put "/types/:id/active", to: "types#change_active"

      #Enpoint para listar las lineas de investigacion
      resources :research_focus, only: [:index, :show]

      #Enpoint para actualizar los documentos de los convenios
      put "agreement/:id/attach/", to: "agreement#attach"

      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      get "/health", to: "health#health"

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
        # Book
        resources :books, only: [:index, :show, :create, :update]
        put "/books/:id/active", to: "books#change_active"


        # Book chapter
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
      end

      # RESEARCH UNIT PRODUCT ENDPOINTS
      ## Participants in product creation
      resources :books, :book_chapters, :ip_livestock_breeds, :new_animal_breeds,
                :papers, :patents, :research_creation_works, :scientific_notes,
                :vegetable_varieties, only: [] do
        resources :ext_participants, only: [:index, :show, :create, :update]
        resources :int_participants, only: [:index, :show, :create, :update]
        resources :documents, only: [:index, :show, :create, :update]
      end

      ## General
      resources :editorials, only: [:index, :show, :create, :update]
      resources :journals, only: [:index, :show, :create, :update]

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
