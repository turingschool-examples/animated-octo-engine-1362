class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id]) 
    @actors = @movie.actor_order_age

    if
      params[:name].present?
      new_actor = Actor.find_by(name: params[:name])
      @movie.actors << new_actor 
      redirect_to "/movies/#{@movie.id}"
    end 
  end
end