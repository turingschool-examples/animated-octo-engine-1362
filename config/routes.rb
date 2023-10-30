Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "application#welcome"

  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new"
  get "/movies/:id", to: "movies#show"
  post "/movies", to: "movies#create"
  get "/movies/:id/edit", to: "movies#edit"
  patch "/movies/:id", to: "movies#update"
  delete "/movies/:id", to: "movies#destroy"

  get "/actor", to: "actor#index"
  get "/actor/:id", to: "actor#show"
  get "/actor/:id/edit", to: "actor#edit"
  patch "/actor/:id", to: "actor#update"
  delete "/actor/:id", to: "actor#destroy"

  get "/studios", to: "studios#index"
  get "/studios/new", to: "studios#new"
  get "/studios/:id", to: "studios#show"
  post "/studios", to: "studios#create"
  get "/studios/:id/edit", to: "studios#edit"
  patch "/studios/:id", to: "studios#update"
  delete "/studios/:id", to: "studios#destroy"

  get "/movies/:movie_id/actors", to: "movie_actors#index"
  get "/movies/:movie_id/actors/new", to: "actors#new"
  post "/movies/:movie_id/actors", to: "actors#create"

end
