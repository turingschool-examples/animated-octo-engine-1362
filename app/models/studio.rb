class Studio < ApplicationRecord
  has_many :movies

  def studio_movies
    movies.pluck(:title)
  end
end
