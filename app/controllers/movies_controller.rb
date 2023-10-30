class MoviesController < ApplicationController
  def show
    @movie = Movie.includes(:actors).find(params[:id])
    @actors = @movie.actors.order(age: :asc)
    @average_age = @actors.average(:age)
  end
end