class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_by_age
    actors.order(:age).pluck(:name)
  end

  def average_actor_age
    actors.average(:age)
  end

  def add_actor(actor_id)
    actors << Actor.find_by(id: actor_id)
  end
end
