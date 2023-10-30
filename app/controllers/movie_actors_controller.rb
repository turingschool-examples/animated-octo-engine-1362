class MovieActorsController < ApplicationController
  def new

  end

  def create
    movie = Movie.find(params[:id])
    actor = movie.actors.find(params[:actor_id])
    @movie.actors.create!({movie_id: movie.id, actor_id: actor.id})

    redirect_to "/movies/#{movie.id}"
  end
end