class Studio < ApplicationRecord
  validates_presence_of :name, :location

  has_many :movies
  has_many :movie_actors, through: :movies
  has_many :actors, through: :movie_actors

  def studio_actors
    actors.distinct
  end
end
