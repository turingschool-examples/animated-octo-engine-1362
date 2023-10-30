class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_list
    actors.order(age: :asc)
  end

  def ave_actors_age
    actors.average(:age).ceil
  end
end
