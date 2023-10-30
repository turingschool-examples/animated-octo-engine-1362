class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors

    @ordered_actors = @movie.order_actors
    @average_age_of_cast = @movie.average_age
  end

  def update
    @movie = Movie.find(params[:id])

    if params[:search].present?
      @actor = Actor.find(params[:search])
      @movie.add_actor(@actor)
      @ordered_actors = @movie.order_actors
      @average_age_of_cast = @movie.average_age
      
      redirect_to "/movies/#{@movie.id}"
    end
  end
end
