class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors

    @ordered_actors = @movie.order_actors
    @average_age_of_cast = @movie.average_age
  end
end