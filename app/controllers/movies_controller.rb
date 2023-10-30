class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    
    redirect_to "/movies/#{params[:id]}"
  end
end