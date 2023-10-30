class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actor_sort
    @avg_age = @movie.avg_age
  end
  
end