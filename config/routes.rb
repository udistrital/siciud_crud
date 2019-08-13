Rails.application.routes.draw do
  get "/api" => redirect("/swagger/dist/index.html?url=/api/v1/apidocs/")
  namespace :api do
    namespace :v1 do
      get "country", to: "country#index"
      get "country/:name", to: "country#show"
      resources :apidocs, only: [:index]
      #resources :country, only: [:index, :show]
      #get 'agreement/index'
      #get 'agreement/show'
      #get 'agreement/create'
      #get 'agreement/update'
      #get 'agreement_type/index'
      #get 'agreement_type/show'
      #get 'agreement_type/create'
      #get 'agreement_status/index'
      # get 'agreement_status/show'

      #Endpoint para listar los estados de los grupos de investigacion
      resources :state_group, only: [:index, :show]
      #get "state_group/", to: "state_group#index"

      #get "state_group/:id", to: "state_group#show"
      #Enpoint para listar las lineas de investigacion
      resources :research_focus, only: [:index, :show]
      #get "research_focus/", to: "research_focus#index"
      #get "research_focus/:id", to: "research_focus#show"
      #Enpoint para actualizar los documentos de los grupos de investigacion
      put "research_group/:id/attach/", to: "research_group#attach"
      #Enpoint para actualizar los documentos de los grupos de investigacion
      put "research_seedbed/:id/attach/", to: "research_seedbed#attach"
      #Enpoint para listar los snies
      resources :snies, only: [:index, :show]
      #get "snies/", to: "snies#index"
      #get "snies/:id", to: "snies#show"
      #Enpoint para listar las facultades
      resources :faculty, only: [:index, :show]
      #get "faculty/", to: "faculty#index"
      #Enpoint para listar los proyectos curriculares las facultades
      #get "faculty/:id", to: "faculty#show"
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      get "/health", to: "health#health"
      # end
      #end
      resources :researcher, only: [:index, :show, :update, :create]
      resources :faculty, only: [:index, :show] do
        resources :curricular_project, only: [:index, :show]
      end
      resources :funding_entity, only: [:index, :show, :create, :update]
      resources :entity_type, only: [:index]
      resources :item_category, only: [:index, :show, :create, :update]
      resources :agreement_status, only: [:index, :show]
      resources :agreement_type, only: [:index, :show, :create]
      resources :agreement, only: [:index, :show, :create, :update] do
        resources :contribution, only: [:index, :show, :create, :update]
        # do
        #   resources :contribution_funding_entity_item, only: [:index, :show, :create, :update]
        # end
        resources :agreement_research_project, only: [:index, :show, :create, :update]
      end
      resources :contribution, only: [] do
        resources :contribution_funding_entity_item, only: [:index, :show, :create, :update]
      end
      resources :agreement_research_project, only: [:index, :show, :create, :update] do
        resources :contribution_rp_item, only: [:index, :show, :create, :update]
      end
      #get 'curricular_project/index'
      #get 'curricular_project/show'
      #get 'research_seedbed/index'
      #get 'research_seedbed/show'
      #get 'research_seedbed/create'
      #get 'research_seedbed/update'

      # get 'research_group/index'
      # get 'research_group/show/:id'
      # post 'research_group/create'
      # get 'research_group/update'
      # Enpoint CRUD de los grupos des investigacion
      resources :research_group, only: [:index, :show, :create, :update] do
        #    member do

        # GET    /research_group/:id/plan_periods                                         plan_periods#index                    [Endpoint para listar los periodos de un plan de accion]
        # POST   /research_group/:id/plan_periods                                         plan_periods#create                   [Endpoint para crear los periodos de un plan de accion]
        # GET    /research_group/:id/plan_periods/:id                                     plan_periods#show                     [Endpoint para mostrar un periodo de un plan de accion]
        # PATCH  /research_group/:id/plan_periods/:id                                     plan_periods#update                   [Endpoint para editar un periodo de un plan de accion]
        # PUT    /research_group/:id/plan_periods/:id                                     plan_periods#update                   [Endpoint para actualizar un periodo de un plan de accion]
        # DELETE /research_group/:id/plan_periods/:id                                     plan_periods#destroy                  [Endpoint para eliminar un periodo de un plan de accion]

        resources :plan_periods do
          #       member do

          # GET    /research_group/:id/plan_periods/:id/research_project_plans              research_project_plans#index          [Endpoint para listar los proyectos de investigacion de un plan de accion]
          # POST   /research_group/:id/plan_periods/:id/research_project_plans              research_project_plans#create         [Endpoint para crear los proyectos de investigacion de un plan de accion]
          # GET    /research_group/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#show           [Endpoint para mostrar un proyecto de investigacion de un plan de accion]
          # PATCH  /research_group/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#update         [Endpoint para editar un proyecto de investigacion de un plan de accion]
          # PUT    /research_group/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#update         [Endpoint para actualizar un proyecto de investigacion de un plan de accion]
          # DELETE /research_group/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#destroy        [Endpoint para eliminar un proyecto de investigacion de un plan de accion]

          resources :research_project_plan

          # GET    /research_group/:id/plan_periods/:id/researcher_formation_plans          researcher_formation_plans#index      [Endpoint para listar los planes de formacion de investigadores de un plan de accion]
          # POST   /research_group/:id/plan_periods/:id/researcher_formation_plans          researcher_formation_plans#create     [Endpoint para crear los planes de formacion de investigadores de un plan de accion]
          # GET    /research_group/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#show       [Endpoint para mostrar un plan de formacion de investigadores de un plan de accion]
          # PATCH  /research_group/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#update     [Endpoint para editar un plan de formacion de investigadores de un plan de accion]
          # PUT    /research_group/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#update     [Endpoint para actualizar un plan de formacion de investigadores de un plan de accion]
          # DELETE /research_group/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#destroy    [Endpoint para eliminar un plan de formacion de investigadores de un plan de accion]

          resources :researcher_formation_plan

          # GET    /research_group/:id/plan_periods/:id/result_transfer_plans               result_transfer_plans#index           [Endpoint para listar los planes de transferencia de resultados de un plan de accion]
          # POST   /research_group/:id/plan_periods/:id/result_transfer_plans               result_transfer_plans#create          [Endpoint para crear los planes de transferencia de resultados de un plan de accion]
          # GET    /research_group/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#show            [Endpoint para mostrar un plan de transferencia de resultados de un plan de accion]
          # PATCH  /research_group/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#update          [Endpoint para editar un plan de transferencia de resultados de un plan de accion]
          # PUT    /research_group/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#update          [Endpoint para actualizar un plan de transferencia de resultados de un plan de accion]
          # DELETE /research_group/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#destroy         [Endpoint para eliminar un plan de transferencia de resultados de un plan de accion]

          resources :result_transfer_plan

          # GET    /research_group/:id/plan_periods/:id/social_appropriation_plans          social_appropriation_plans#index      [Endpoint para listar los planes de apropiacion social de un plan de accion]
          # POST   /research_group/:id/plan_periods/:id/social_appropriation_plans          social_appropriation_plans#create     [Endpoint para crear los planes de apropiacion social de un plan de accion]
          # GET    /research_group/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#show       [Endpoint para mostrar un plan de apropiacion social de un plan de accion]
          # PATCH  /research_group/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#update     [Endpoint para editar un plan de apropiacion social de un plan de accion]
          # PUT    /research_group/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#update     [Endpoint para actualizar un plan de apropiacion social de un plan de accion]
          # DELETE /research_group/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#destroy    [Endpoint para eliminar un plan de apropiacion social de un plan de accion]

          resources :social_appropriation_plan
        end
        #    end
        # end
      end

      resources :research_seedbed, only: [:index, :show, :create, :update] do
        #member do

        # GET    /research_seedbed/:id/plan_periods                                         plan_periods#index                    [Endpoint para listar los periodos de un plan de accion]
        # POST   /research_seedbed/:id/plan_periods                                         plan_periods#create                   [Endpoint para crear los periodos de un plan de accion]
        # GET    /research_seedbed/:id/plan_periods/:id                                     plan_periods#show                     [Endpoint para mostrar un periodo de un plan de accion]
        # PATCH  /research_seedbed/:id/plan_periods/:id                                     plan_periods#update                   [Endpoint para editar un periodo de un plan de accion]
        # PUT    /research_seedbed/:id/plan_periods/:id                                     plan_periods#update                   [Endpoint para actualizar un periodo de un plan de accion]
        # DELETE /research_seedbed/:id/plan_periods/:id                                     plan_periods#destroy                  [Endpoint para eliminar un periodo de un plan de accion]

        resources :plan_periods do
          #   member do

          # GET    /research_seedbed/:id/plan_periods/:id/research_project_plans              research_project_plans#index          [Endpoint para listar los proyectos de investigacion de un plan de accion]
          # POST   /research_seedbed/:id/plan_periods/:id/research_project_plans              research_project_plans#create         [Endpoint para crear los proyectos de investigacion de un plan de accion]
          # GET    /research_seedbed/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#show           [Endpoint para mostrar un proyecto de investigacion de un plan de accion]
          # PATCH  /research_seedbed/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#update         [Endpoint para editar un proyecto de investigacion de un plan de accion]
          # PUT    /research_seedbed/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#update         [Endpoint para actualizar un proyecto de investigacion de un plan de accion]
          # DELETE /research_seedbed/:id/plan_periods/:id/research_project_plans/:id          research_project_plans#destroy        [Endpoint para eliminar un proyecto de investigacion de un plan de accion]

          resources :research_project_plan

          # GET    /research_seedbed/:id/plan_periods/:id/researcher_formation_plans          researcher_formation_plans#index      [Endpoint para listar los planes de formacion de investigadores de un plan de accion]
          # POST   /research_seedbed/:id/plan_periods/:id/researcher_formation_plans          researcher_formation_plans#create     [Endpoint para crear los planes de formacion de investigadores de un plan de accion]
          # GET    /research_seedbed/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#show       [Endpoint para mostrar un plan de formacion de investigadores de un plan de accion]
          # PATCH  /research_seedbed/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#update     [Endpoint para editar un plan de formacion de investigadores de un plan de accion]
          # PUT    /research_seedbed/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#update     [Endpoint para actualizar un plan de formacion de investigadores de un plan de accion]
          # DELETE /research_seedbed/:id/plan_periods/:id/researcher_formation_plans/:id      researcher_formation_plans#destroy    [Endpoint para eliminar un plan de formacion de investigadores de un plan de accion]

          resources :researcher_formation_plan

          # GET    /research_seedbed/:id/plan_periods/:id/result_transfer_plans               result_transfer_plans#index           [Endpoint para listar los planes de transferencia de resultados de un plan de accion]
          # POST   /research_seedbed/:id/plan_periods/:id/result_transfer_plans               result_transfer_plans#create          [Endpoint para crear los planes de transferencia de resultados de un plan de accion]
          # GET    /research_seedbed/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#show            [Endpoint para mostrar un plan de transferencia de resultados de un plan de accion]
          # PATCH  /research_seedbed/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#update          [Endpoint para editar un plan de transferencia de resultados de un plan de accion]
          # PUT    /research_seedbed/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#update          [Endpoint para actualizar un plan de transferencia de resultados de un plan de accion]
          # DELETE /research_seedbed/:id/plan_periods/:id/result_transfer_plans/:id           result_transfer_plans#destroy         [Endpoint para eliminar un plan de transferencia de resultados de un plan de accion]

          resources :result_transfer_plan

          # GET    /research_seedbed/:id/plan_periods/:id/social_appropriation_plans          social_appropriation_plans#index      [Endpoint para listar los planes de apropiacion social de un plan de accion]
          # POST   /research_seedbed/:id/plan_periods/:id/social_appropriation_plans          social_appropriation_plans#create     [Endpoint para crear los planes de apropiacion social de un plan de accion]
          # GET    /research_seedbed/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#show       [Endpoint para mostrar un plan de apropiacion social de un plan de accion]
          # PATCH  /research_seedbed/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#update     [Endpoint para editar un plan de apropiacion social de un plan de accion]
          # PUT    /research_seedbed/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#update     [Endpoint para actualizar un plan de apropiacion social de un plan de accion]
          # DELETE /research_seedbed/:id/plan_periods/:id/social_appropriation_plans/:id      social_appropriation_plans#destroy    [Endpoint para eliminar un plan de apropiacion social de un plan de accion]

          resources :social_appropriation_plan
        end
      end
    end
  end
end
