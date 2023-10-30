class Studio < ApplicationRecord
  has_many :movies

  def list_movies_details
    movies_details = movies.pluck(:title, :creation_year, :genre)

    movies_details = movies_details.flat_map do |movie|
      movie.join(", ")
    end
  end

  def list_actors
    movies.joins(:actors).distinct.pluck(:name).to_sentence
  end
end
