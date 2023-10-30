class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  validates :title, presence: true
  validates :creation_year, presence: true, numericality: true
  validates :genre, presence: true
end
