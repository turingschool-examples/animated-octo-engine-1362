class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actor_sort
    actors.order(age: :asc)
  end

  def avg_age
    actors.average(:age).to_f.round(1)
  end
end
