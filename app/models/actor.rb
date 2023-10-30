class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates :name, presence: true 
  validates :age, presence: true, numericality: true 

  def self.average_age
    average(:age).round(2)
  end
end