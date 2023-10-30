class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies
end

def average_age
  actors.average(:age)
end
  