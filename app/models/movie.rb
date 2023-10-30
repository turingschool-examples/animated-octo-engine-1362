class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def average_age(actors)
    age = 0
    actors.each do |actor|
      age += actor.age
    end
    age = age / actors.count
    age
  end
end
