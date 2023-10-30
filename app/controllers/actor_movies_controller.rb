class ActorMoviesController < ApplicationController
  def new
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end

  def create
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @actor = @movie.actors.create(actor_params)
    redirect_to "/movies/#{@movie.id}"
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end