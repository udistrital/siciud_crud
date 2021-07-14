Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "health#health"
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
      get "/types_all", to: "types#all_types_and_subtypes"
      resources :subtypes, only: [:index, :show, :create, :update]
      get "/subtypes/by-type/:type_id", to: "subtypes#subtypes_by_type"

      resources :gm_states, only: [:index, :show]
      resources :role, only: [:index, :show, :create, :update]
      resources :researchers, only: [:index, :show, :update, :create]
      get "researcher_research_units", to: "researchers#researcher_research_units"

      resources :user_roles, only: [:index, :show, :create, :update]
      resources :users, only: [:index, :show, :create, :update]
      put "/users/:id/active", to: "users#change_active"

      # Enpoint CRUD de los grupos de investigacion
      resources :research_group, only: [:index, :show, :create, :update], path: 'research_units' do
        resources :documents, only: [:index, :show, :create, :update]
        resources :group_member, only: [:index, :show, :create, :update]
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
        resources :call_items, only: [:index, :create]
        resources :calls_indicators, only: [:index, :create]
      end
      resources :call_documents, only: [:show, :update]
      resources :call_items, only: [:show, :update]
      resources :calls_indicators, only: [:show, :update]

    end
  end
end
