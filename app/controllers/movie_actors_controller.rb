class MovieActorsController < ApplicationController
  def create
    @actor = Actor.find(params[:actor])
    @movie = Movie.find(params[:movie_id])
    ActorMovie.create!(actor: @actor, movie: @movie)

    redirect_to "/movies/#{@movie.id}"
  end
end