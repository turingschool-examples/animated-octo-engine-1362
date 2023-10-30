class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.ordered_by_age
    order(:age).pluck(:name)
  end

  def self.average_age
    average(:age)
  end
end
