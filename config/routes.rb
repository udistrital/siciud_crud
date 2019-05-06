Rails.application.routes.draw do
  

  # get 'research_group/index'
  # get 'research_group/show/:id'
  # post 'research_group/create'
  # get 'research_group/update'
  resources :research_group,only: [:index,:show,:create,:update]
    
  
  
  get 'state_group/', to: 'state_group#index'
  get 'state_group/:id', to: 'state_group#show'
  
  get 'research_focus/', to: 'research_focus#index'
  get 'research_focus/:id', to: 'research_focus#show'

  get 'snies/', to: 'snies#index'
  get 'snies/:id', to: 'snies#show'

  get 'faculty/', to: 'faculty#index'

  get 'faculty/:id', to: 'faculty#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
end
