class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  validates :title, :creation_year, :genre, presence: true

  def youngest_to_oldest
    actors.order(:age)
  end

  def average_age
    actors.average(:age).round(2)
  end
end
