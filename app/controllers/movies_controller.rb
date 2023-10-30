class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    actor = Actor.find(params[:add_actor])
    movie.add_actor(actor)
    redirect_to "/movies/#{movie.id}"
  end
end