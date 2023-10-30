class Actor < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  has_many :movie_actors
  has_many :movies, through: :movie_actors
end
