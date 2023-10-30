class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_sorted
    self.actors.order(:age)
  end

  def actor_age_avg
    if self.actors.count(:id) == 0
      0
    else
      self.actors.average(:age).round(2)
    end
  end
end
