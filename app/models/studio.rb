class Studio < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  has_many :movies

  def actors
    Actor.joins(movies: :studio).where("studios.id = ?", id).distinct.pluck(:name)
  end
end
