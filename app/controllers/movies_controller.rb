class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actor_names = @movie.order_by_age
    @avg_age = @movie.avg_age
    if params[:search_by_name].present? 
      threshold = params[:search_by_name].to_s
      @actors = Actor.filter_by_name(threshold)
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @actor = Actor.find(params[:actor_id])
    @movie.actors << @actor
    redirect_to "/movies/#{@movie.id}"
  end

end