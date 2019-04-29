Rails.application.routes.draw do
  get 'research_group/index'
  get 'research_group/show'
  get 'research_group/create'
  get 'research_group/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
end
