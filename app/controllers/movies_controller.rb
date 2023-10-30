class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    if params[:search] == "actor" && params[:actor_id].present? 
      actor_id = params[:actor_id]
      @search_actors = Actor.where("id::text LIKE ?", "%#{actor_id}%")
    end
  end

end