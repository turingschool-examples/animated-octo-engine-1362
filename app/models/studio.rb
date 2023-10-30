class Studio < ApplicationRecord
  validates_presence_of :name, :location
  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
