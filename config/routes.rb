Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # studios 
  get "/studios", to: "studios#index" 

  # movies 
  get "/movies/:id", to: "movies#show"
  
end
