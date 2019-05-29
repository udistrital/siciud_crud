Rails.application.routes.draw do
  

  #get 'research_seedbed/index'
  #get 'research_seedbed/show'
  #get 'research_seedbed/create'
  #get 'research_seedbed/update'


  # get 'research_group/index'
  # get 'research_group/show/:id'
  # post 'research_group/create'
  # get 'research_group/update'
  # Enpoint CRUD de los grupos des investigacion
  resources :research_group,only: [:index,:show,:create,:update]
  resources :research_seedbed,only: [:index,:show,:create,:update]
  
  #Enpoint para listar los estados de los grupos de investigacion
  get 'state_group/', to: 'state_group#index'

  get 'state_group/:id', to: 'state_group#show'
  #Enpoint para listar las lineas de investigacion
  get 'research_focus/', to: 'research_focus#index'
  get 'research_focus/:id', to: 'research_focus#show'
  #Enpoint para actualizar los documentos de los grupos de investigacion
  put 'research_group/attach/:id', to: 'research_group#attach'
  #Enpoint para actualizar los documentos de los grupos de investigacion
  put 'research_seedbed/attach/:id', to: 'research_seed_bed#attach'
  #Enpoint para listar los snies
  get 'snies/', to: 'snies#index'
  get 'snies/:id', to: 'snies#show'
  #Enpoint para listar las facultades
  get 'faculty/', to: 'faculty#index'
  #Enpoint para listar los proyectos curriculares las facultades
  get 'faculty/:id', to: 'faculty#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
end
