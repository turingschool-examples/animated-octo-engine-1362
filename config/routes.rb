Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/studios", to: "studios#index"

  get "/movies/:id", to: "movies#show"
  get "/movies/:id/movie_actors/new", to: "movie_actors#new"
  post "movies/:id/movie_actors", to: "movie_actors#create"

end
