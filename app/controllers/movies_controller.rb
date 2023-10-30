class MoviesController < ApplicationController
  def show
    @movie = Movie.includes(:actors).find(params[:id])
    @actors = @movie.actors.order(age: :asc)
    @average_age = @actors.average(:age)
  end

  def update
    @movie = Movie.find(params[:id])
    
    redirect_to @movie
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:actor_id)
  end
end