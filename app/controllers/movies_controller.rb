class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.order(age: :asc)
    
    def average_age(actors)
      age = 0
      actors.each do |actor|
        age += actor.age
      end
      age = age / actors.count
      age
    end
    
    @average = average_age(@actors)

  end
end