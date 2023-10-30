class Studio < ApplicationRecord
  has_many :movies
  has_many :movie_actors, through: :movies
  has_many :actors, through: :movie_actors

  def unique_actors
    actors.distinct
  end
end
