class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def staff
    self.actors.order(age: :desc)
  end

  def add_actor(actor)
    self.actors << actor
  end

end
