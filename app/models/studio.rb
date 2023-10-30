class Studio < ApplicationRecord
  has_many :movies

  def studio_movies
    movies.pluck(:title)
  end

  def contributing_actors
    acts = Actor.joins(:movies).where(movies: {id: movies}).distinct.pluck(:name)

  end
end
