class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.order_by_age
    order(age: :desc)
  end

  def average_age
    actors.average(:age)
  end
end