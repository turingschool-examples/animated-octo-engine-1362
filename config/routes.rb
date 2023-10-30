Rails.application.routes.draw do
  get "/studios", to: "studios#index"

  get "/movies/:id", to: "movies#show"

  # I wanted to do the path /movies/:movie_id/actors/:actor_id but wasn't
  # able to get it to work, not sure why. Guidance here would be appreciated.
  post "/movies/:id", to: "actor_movies#create"
end
