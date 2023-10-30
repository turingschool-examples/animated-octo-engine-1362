class Studio < ApplicationRecord
  has_many :movies

  def list_movies_details
    movies_details = movies.pluck(:title, :creation_year, :genre)

    movies_details = movies_details.flat_map do |movie|
      movie.join(", ")
    end
  end
end
