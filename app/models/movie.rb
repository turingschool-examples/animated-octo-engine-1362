class Movie < ApplicationRecord
  belongs_to :studio
  has_and_belongs_to_many :actors
  # has_many :actors, through: :actor_movie
end
