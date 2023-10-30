class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.sort_asc_age
    Actor.all.order(age: :asc)
  end
  
  def actor_movies(studio_id)
    movies.where(studio_id: studio_id).pluck(:title)
  end

end