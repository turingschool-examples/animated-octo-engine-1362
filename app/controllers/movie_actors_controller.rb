class MovieActorsController < ApplicationController
  def new

  end

  def create
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:actor_id])
    MovieActor.create!({actor_id: actor.id, movie_id: movie.id})

    redirect_to "/movies/#{movie.id}"
  end
end