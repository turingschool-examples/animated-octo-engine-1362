class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actor_names = @movie.order_by_age
    @avg_age = @movie.avg_age
  end

end