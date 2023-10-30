class Actor < ApplicationRecord
  has_many :movies, through: :studio_movies
end
