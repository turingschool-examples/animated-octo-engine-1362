class MovieActorsController < ApplicationController

  def new
    MovieActor.create!(
      movie_id: params[:id],
      actor_id: params[:add_actor]
    )
    @movie = Movie.find(params[:id])
    redirect_to "/movies/#{@movie.id}"
  end

end