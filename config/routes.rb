Rails.application.routes.draw do
  get "/studios", to: "studios#index"

  get "/movies/:movie_id", to: "movies#show"

  post "/movies/:movie_id/actors/:actor_id", to: "actor_movies#create"
end
