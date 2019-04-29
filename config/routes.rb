Rails.application.routes.draw do
  # get 'research_group/index'
  # get 'research_group/show/:id'
  # post 'research_group/create'
  # get 'research_group/update'
   resources :research_group,only: [:index,:show,:create,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
end
