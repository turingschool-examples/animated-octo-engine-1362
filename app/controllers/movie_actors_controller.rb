class MovieActorsController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    new_actor = Actor.find(params[:actor_id])
    MovieActor.create!(movie: movie, actor: new_actor)
    redirect_to "/movies/#{movie.id}"
  end
end