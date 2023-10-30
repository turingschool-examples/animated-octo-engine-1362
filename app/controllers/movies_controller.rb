class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order(age: :asc)
    @average_age = @actors.average(:age)
  end

  def add_actor
    @movie = Movie.find(params[:id])
    actor = Actor.find_by(id: params[:movie][:actor_id]) # Find the actor by ID, returns nil if not found

    if actor
      @movie.actors << actor
    else
      flash[:alert] = "Actor with ID #{params[:movie][:actor_id]} not found."
    end
    
    redirect_to "/movies/#{@movie.id}"
  end
end

