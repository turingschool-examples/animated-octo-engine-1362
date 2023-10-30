class MoviesController < ApplicationController
  def show  
    @movie = Movie.find(params[:id])
    if params[:actor_id]
      @movie.add_actor(params[:actor_id])
      
      redirect_to "/movies/#{@movie.id}"
    end
  end
end