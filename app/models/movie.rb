class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_list
    self.actors.order(age: :asc).pluck(:name)
  end

  def cast_age
    Actor.average(:age).to_int
  end
end
