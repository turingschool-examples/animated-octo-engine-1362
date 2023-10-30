class Studio < ApplicationRecord
  has_many :movies

  def actors_featured
    movie_ids = movies.pluck(:id)
    actors_featured = Actor.joins(:movies,:movie_actors).where(movies: {id: movie_ids}).distinct
  end

end
