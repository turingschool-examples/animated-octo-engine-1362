class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  validates :title, presence: true
  validates :creation_year, presence: true, numericality: true
  validates :genre, presence: true

  def order_actors
    actors.order(:age)
  end

  def average_age
    ages = []
    actors.each do |actor|
      ages << actor.age
    end
    average = ages.sum / ages.length.to_f.round(1)
    average
  end
end
