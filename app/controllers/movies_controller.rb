class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors_average_age = @movie.average_age
  end
end
