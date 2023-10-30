class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def average_actor_age
    actors.pluck(:age).sum / actors.count
  end
end
