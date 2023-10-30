class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  validates :title, :creation_year, :genre, presence: true
end
