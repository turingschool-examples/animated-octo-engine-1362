class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def create

  end
end