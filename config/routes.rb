Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/movies/:id/add_actor', to: 'movies#add_actor'
  get '/studios', to: 'studios#index' 
  get '/movies/:id', to: 'movies#show'
  

end
